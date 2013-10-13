class Admin::WorksController < ApplicationController
  before_filter :get_artist
  
  def new
  end
  
  def create
    @piece = @artist.pieces.create(piece_params)
  end
  
  def edit
    @piece = @artist.pieces.find(params[:id])
  end
  
  def update
    @piece = @artist.pieces.find(params[:id])
    @piece.update_attributes(piece_params)
  end
  
  def destroy
    @piece = @artist.pieces.find(params[:id])
    @piece.destroy
  end
  
  protected
  def piece_params
    params.require(:piece).permit(:title, :description, :artist_name, :year, :dimensions, :edition_details, :upload_url, :upload_key)
  end
  
  def get_artist
    @artist = Artist.find(params[:artist_id])
  end
  
end
