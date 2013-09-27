class Admin::WorksController < ApplicationController
  before_filter :get_artist
  
  def new
  end
  
  def create
    @piece = @artist.pieces.create(piece_params)
  end
  
  protected
  def piece_params
    params.require(:piece).permit(:name, :description, :upload_url, :upload_key)
  end
  
  def get_artist
    @artist = Artist.find(params[:artist_id])
  end
  
end
