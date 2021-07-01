class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(status: 'pre-payment').find(params[:order_id])
    @delivery = current_user.deliveries.where(status: 'pre-payment').find(params[:delivery_id])
  end
end
