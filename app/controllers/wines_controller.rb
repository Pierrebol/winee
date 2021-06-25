class WinesController < ApplicationController
  def index
    @wines = Wine.where("category != 'Spiritueux'")
    @spirits = Wine.where("category = 'Spiritueux'")
  end

  def user_index
    @winebox = Winebox.new
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
    if params[:search].present?
      @wines = Wine.search_by_name_grapevariety_vineyard_category_country_and_year(params[:search])
    else
      @wines = Wine.all
    end
  end
end