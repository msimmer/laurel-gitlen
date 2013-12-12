class Admin::ExhibitionsController < ApplicationController
  before_filter :require_login
  before_filter :get_exhibition, only: [:edit, :show, :update, :destroy]
  
  layout 'admin'
  
  def index
    @exhibitions = Exhibition.all
  end
  
  def new
    @exhibition = Exhibition.new
  end
  
  def create
    @exhibition = Exhibition.new(exhibition_params)
    @exhibition.save_with_artists
  end
  
  def show
    @works = @exhibition.pieces
    @artists = @exhibition.artists
  end
  
  def edit
  end
  
  def update
    @exhibition.attributes = exhibition_params
    @exhibition.save_with_artists
    @artists = @exhibition.artists
  end
  
  def aws_callback
  end
  
  def destroy
    @exhibition.destroy
  end
  
  protected
  def exhibition_params
    params.require(:exhibition).permit(:name, :begins, :ends, :description, :art_fair, :artists_ids => [])
  end
  
  def get_exhibition
    @exhibition = Exhibition.find(params[:id])
  end
  
end
