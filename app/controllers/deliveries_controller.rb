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
