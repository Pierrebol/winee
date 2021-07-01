class DeliveriesController < ApplicationController
  def show
    @delivery = Delivery.find(params[:id])
    @delivery_products = DeliveryProduct.where(delivery_id: @delivery.id)
    @prices = @delivery_products.map do |delivery_product|
      delivery_product.quantity_of_wine * Wine.find(delivery_product.wine_id).price
    end
    @subtotal = @prices.reduce(0, :+)
    @shipping_fees = (@subtotal * 0.1).round(2)
    @user = User.where(id: current_user.id)
    @markers = @user.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        image_url: helpers.asset_url('corkscrew.png')
      }
    end
  end

  def update
    # changer le statut du cart
    @delivery = Delivery.find(params[:id])
    @delivery.total_price_cents = params[:total_price_cents].to_i
    @delivery.status = "pre-payment"
    @delivery.save!

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        type: 'delivery',
        name: @delivery.wines[0].name,
        amount: @delivery.total_price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: 'http://2c422d7462fd.ngrok.io/confirmation',
      cancel_url: order_url(@delivery)
    )

    @delivery.update(checkout_session_id: session.id)
    redirect_to new_delivery_payment_path(@delivery), status: 303
  end

  def user_index
  end

  def destroy
  end

  private

  def delivery_params
    params.require(:delivery_product).permit(:wine_id, :delivery_id, :quantity_of_wine)
  end
end
