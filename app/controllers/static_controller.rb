class StaticController < ApplicationController
  def splash
    @exhibition = Exhibition.find_by_id(57) || Exhibition.where("begins <= ?", Date.today).order("begins DESC").first
  end
  
  def contact
  end
  
  def archives
    @stories = Story.order('date desc').all
    @stories_by_month = @stories.group_by{ |e| e.date.month }
  end
end
