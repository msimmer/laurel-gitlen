class Admin::ArtistsController < ApplicationController
  before_filter :get_artist, only: [:edit, :show, :update, :aws_callback, :cv_callback]

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
    render "cv" unless params[:cv].blank?
  end
  
  def update
    @artist.update_attributes(artist_params)
  end
  
  def aws_callback
  end
  
  def cv_callback
    @artist.update_attribute(:cv_url, cv_params[:url])
  end
  
  protected
  def artist_params
    params.require(:artist).permit(:name, :gallery_roster)
  end
  
  def cv_params
    params.permit(:url)
  end
  
  def get_artist
    @artist = Artist.find(params[:id])
  end
  
end
