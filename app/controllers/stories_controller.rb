class StoriesController < ApplicationController
  def index
    @artists = Artist.on_roster.all(include: :stories).sort_by { |a| a.name.split(" ").last.downcase }.delete_if { |a| a.stories.featured.blank? }
  end
  
  def show
  end
end
