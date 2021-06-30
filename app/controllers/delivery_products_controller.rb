class DeliveryProductsController < ApplicationController
  def create
    @delivery_product = DeliveryProduct.new(deliverproduct_params)
    @delivery_id = params[:delivery_id].to_i
    @delivery_product.delivery_id = @delivery_id
    @wine = Wine.find(params[:delivery_product][:wine_id])

    if @delivery_product.save
        redirect_to wines_path, notice: "#{params[:delivery_product][:quantity_of_wine]} bouteille(s) de #{@wine.name} ont été ajoutées à votre panier de livraison :)"
    else
        render root_path
    end
  end

  def destroy
    @delivery = Delivery.find(params[:delivery_id])
    @delivery_product = DeliveryProduct.find(params[:id])
    @delivery_product.destroy

    redirect_to delivery_path(@delivery)
  end

  def add
    @delivery = Delivery.find(params[:delivery_id])
    @delivery_product = DeliveryProduct.find(params[:id])
    @delivery_product.quantity_of_wine += 1
    @delivery_product.save!
    redirect_to delivery_path(@delivery)
  end

  def remove
    @delivery = Delivery.find(params[:delivery_id])
    @delivery_product = DeliveryProduct.find(params[:id])
    @delivery_product.quantity_of_wine -= 1
    @delivery_product.save!
    redirect_to delivery_path(@delivery)
  end

  private

  def deliverproduct_params
    params.require(:delivery_product).permit(:wine_id, :delivery_id, :quantity_of_wine)
  end
end
