class Admin::DisplaysController < ApplicationController
  layout 'admin'
  
  def new
    @exhibition = Exhibition.find(params[:exhibition_id])
  end
  
  def index
    @exhibition = Exhibition.find(params[:exhibition_id])
    @pieces = @exhibition.pieces
  end
  
  def create
    @exhibition = Exhibition.find(params[:exhibition_id])
    @piece = @exhibition.pieces.create(piece_params)
    piece_order = @exhibition.piece_order || []
    piece_order << @piece.id
    @exhibition.piece_order = piece_order
    @exhibition.save
  end
  
  protected
  def piece_params
    params.require(:piece).permit(:name, :description, :artist_name, :upload_url, :upload_key)
  end
end