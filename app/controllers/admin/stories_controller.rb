class Admin::StoriesController < ApplicationController
  layout 'admin'
  
  def index
    @stories = Story.order('date desc').all
  end
  
  def new
    @story = Story.new
  end
  
  def create
    redirect_to admin_stories_url if (@story = Story.create(story_params))
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    @story.update_attributes(story_params)
  end
  
  protected
  def story_params
    params.require(:story).permit(:story, :date)
  end
end
