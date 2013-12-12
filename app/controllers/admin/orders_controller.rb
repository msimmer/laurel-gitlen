class Admin::OrdersController < ApplicationController
  before_filter :require_login

  def new
    @exhibition = Exhibition.find(params[:exhibition_id])
    @order = params[:order]
  end
  
  def create
    @exhibition = Exhibition.find(params[:exhibition_id])
    unless params[:order].blank? || params[:order_string].blank?
      if params[:order] == 'works'
        @exhibition.piece_order = params[:order_string].split(",").map{ |s| s.to_i }
      elsif params[:order] == 'artists'
        @exhibition.artist_order = params[:order_string].split(",").map{ |s| s.to_i }
      end
      @exhibition.save
    end
  end
end
