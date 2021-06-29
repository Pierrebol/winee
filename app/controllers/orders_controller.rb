class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_wines = OrderWine.where(order_id: @order.id)
    @prices = @order_wines.map do |order_wine|
      order_wine.quantity_of_wine * Wine.find(order_wine.wine_id).price
    end
    raise
    @subtotal = @prices.reduce(0, :+)
    @taxes = (@subtotal * 0.2).round(2)
    @shipping_fees = (@subtotal * 0.1).round(2)
    @total_price = (@subtotal.to_f + @taxes.to_f + @shipping.to_f).round(2)
  end

  def update
    # changer le statut du cart
  end

  def user_index
  end

  def destroy
  end

  private

  def order_params
    params.require(:order_wine).permit(:wine_id, :order_id, :quantity_of_wine)
  end
end
