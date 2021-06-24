class WinesController < ApplicationController
  def index
    @wines = Wine.where("category != 'Spiritueux'")
    @spirits = Wine.where("category = 'Spiritueux'")
  end

  def user_index
    if params[:search].present?
      @wineboxes = Winebox.search_by_title_and_description(params[:search]).where(user: current_user)
    else
      @wineboxes = Winebox.where(user: current_user)
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def all
    @wines = Wine.all
  end
end
