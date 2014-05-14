class StaticController < ApplicationController
  def splash
    @exhibition = Exhibition.find(54)
  end
  
  def contact
  end
  
  def archives
    @stories = Story.order('date desc').all
    @stories_by_month = @stories.group_by{ |e| e.date.month }
  end
end
