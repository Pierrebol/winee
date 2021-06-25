class OrdersController < ApplicationController
  def show
    @orders = Order.find(params[:id])
  end

  def user_index
    @orders = Winebox.where(user: current_user)
  end

  def create
  end

  def destroy
    # "uniquement si status == cart"
  end
end
