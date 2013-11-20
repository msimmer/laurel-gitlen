class ArtistsController < ApplicationController
  def index
    @artists = Artist.on_roster.all(include: :pieces).sort_by {|a| a.name.downcase}
  end
  
  def show
    @artist = Artist.includes(:pieces).find(params[:id])
    @pieces = @artist.pieces
  end
end
