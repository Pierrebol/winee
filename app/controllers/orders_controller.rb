class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_wines = OrderWine.where(order_id: @order.id)
  end

  def update
    # changer le statut du cart
  end

  def user_index
  end

  def destroy
    # @order = Order.find(params[:id])
    # @order_wine = OrderWine.find(order_id: @order.id)
    # raise
    # @order_wine.destroy

    # redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order_wine).permit(:wine_id, :order_id, :quantity_of_wine)
  end
end
