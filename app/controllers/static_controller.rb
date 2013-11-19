class StaticController < ApplicationController
  def splash
    @exhibition = Exhibition.where("begins <= ?", Date.today).order("begins DESC").first
  end
  
  def contact
  end
end
