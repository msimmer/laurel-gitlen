class StaticController < ApplicationController
  def splash
    @exhibition = Exhibition.last(include: :artists)
  end
  
  def contact
  end
end
