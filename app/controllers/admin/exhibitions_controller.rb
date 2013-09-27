class Admin::ExhibitionsController < ApplicationController
  before_filter :require_login
  before_filter :get_exhibition, only: [:edit, :show, :update]
  
  layout 'admin'
  
  def index
    @exhibitions = Exhibition.all
  end
  
  def new
    @exhibition = Exhibition.new
  end
  
  def edit
    @order = params[:order]
  end
  
  def update
  end
  
  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      redirect_to admin_exhibition_url(@exhibition)
    else
      render :new
    end
  end
  
  def show
    @works = @exhibition.pieces
    @artists = @exhibition.artists
  end
  
  def aws_callback
  end
  
  protected
  def exhibition_params
    params.require(:exhibition).permit(:name, :begins, :ends, :description, :artists_ids => [])
  end
  
  def get_exhibition
    @exhibition = Exhibition.find(params[:id])
  end
  
end
