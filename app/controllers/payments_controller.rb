class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(status: 'pre-payment').find(params[:order_id])
  end
end
