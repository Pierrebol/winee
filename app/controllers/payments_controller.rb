class PaymentsController < ApplicationController
  def new
    @order_payment = current_user.orders.where(status: 'pre-payment').find_by(id: params[:order_id])
    @delivery_payment = current_user.deliveries.where(status: 'pre-payment').find_by(id: params[:delivery_id])
  end
end
