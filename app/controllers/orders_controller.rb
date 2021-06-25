class OrdersController < ApplicationController

  def create
    raise
  end

  def show
    @orders = Order.find(params[:id])
  end

  def destroy
    # "uniquement si status == cart"
  end

  def user_index
    @orders = Order.where(user: current_user)
  end

  private

  def order_params

  end
end
