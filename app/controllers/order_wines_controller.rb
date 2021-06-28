class OrderWinesController < ApplicationController
  def create
    @orderwine = OrderWine.new(orderwine_params)
    @order_id = params[:order_id].to_i
    @orderwine.order_id = @order_id
    @wine = Wine.find(params[:order_wine][:wine_id])

    if @orderwine.save
      redirect_to wines_path, notice: "#{params[:order_wine][:quantity_of_wine]} bouteille(s) de #{@wine.name} ont été ajoutées à votre panier :)"
    else
      render root_path
    end
  end

  private

  def orderwine_params
    params.require(:order_wine).permit(:wine_id, :order_id, :quantity_of_wine)
  end
end
