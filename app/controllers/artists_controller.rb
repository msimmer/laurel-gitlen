class ArtistsController < ApplicationController
  def index
    @artists = Artist.all(include: :pieces)
  end
  
  def show
    @artist = Artist.includes(:pieces).find(params[:id])
    @pieces = @artist.pieces
  end
end
