class ArtistsController < ApplicationController
  def index
    @artists = Artist.on_roster.all(include: :pieces)
  end
  
  def show
    @artist = Artist.includes(:pieces).find(params[:id])
    @pieces = @artist.pieces
  end
end
