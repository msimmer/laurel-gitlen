class Admin::ArtistsController < ApplicationController
  before_filter :get_artist, only: [:edit, :show, :update, :aws_callback]

  before_filter :require_login
  layout 'admin'
  
  def index
    @artists = Artist.all
  end
  
  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    redirect_to admin_artist_url(@artist) if @artist.save
  end
  
  def show
  end
  
  def edit
  end
  
  def aws_callback
  end
  
  protected
  def artist_params
    params.require(:artist).permit(:name)
  end
  
  def get_artist
    @artist = Artist.find(params[:id])
  end
  
end
