class Admin::StoriesController < ApplicationController
  layout 'admin'
  
  def index
    @stories = Story.order('date desc').all
  end
  
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(story_params)
    @story.save_with_artists
    redirect_to admin_stories_url
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    @story.attributes = story_params
    @story.save_with_artists
    redirect_to admin_stories_url
  end
  
  def aws_callback
    render nothing: true
  end
  
  protected
  def story_params
    params.require(:story).permit(:story, :date, :featured, :press_release_url, :artists_ids => [])
  end
end
