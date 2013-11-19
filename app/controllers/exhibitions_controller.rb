class ExhibitionsController < ApplicationController
  def index
    @exhibitions = Exhibition.all(order: "begins DESC")
    @exhibitions_by_year = @exhibitions.group_by{ |e| e.begins.year }
  end
  
  def show
    @exhibition = Exhibition.find(params[:id])
    @pieces = @exhibition.pieces
  end
end
