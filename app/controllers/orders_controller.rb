class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_wines = OrderWine.where(order_id: @order.id)
    @prices = @order_wines.map do |order_wine|
      order_wine.quantity_of_wine * Wine.find(order_wine.wine_id).price
    end
    @subtotal = @prices.reduce(0, :+)
    @taxes = (@subtotal * 0.2).round(2)
    @shipping_fees = (@subtotal * 0.1).round(2)
    @total_price = (@subtotal.to_f + @taxes.to_f + @shipping.to_f).round(2)
    @total_price_cents = (@total_price * 100).to_i
  end

  def validate
    # changer le statut du cart
    @order = Order.find(params[:id])
    @order.total_price_cents = params[:total_price_cents].to_i
    @order.status = "pre-payment"
    @order.save!

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
      name: @order.wines[0].name,
      amount: @order.total_price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(@order),
    cancel_url: order_url(@order)
  )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order), status: 303

    # redirect_to order_path(@order)
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
