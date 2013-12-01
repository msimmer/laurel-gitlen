class StaticController < ApplicationController
  def splash
    @exhibition = Exhibition.where("begins <= ?", Date.today).order("begins DESC").first
  end
  
  def contact
  end
  
  def news
    @artists = Artist.on_roster.all(include: :stories).sort_by { |a| a.name.split(" ").last.downcase }.delete_if { |a| a.stories.featured.blank? }
  end
  
  def archives
    @stories = Story.order('date desc').all
    @stories_by_month = @stories.group_by{ |e| e.date.month }
  end
end
