class WinesController < ApplicationController
  def index
    @wines = Wine.where("category != 'Spiritueux'")
    @spirits = Wine.where("category = 'Spiritueux'")
  end

  def show
    @wine = Wine.find(params[:id])
  end
end
