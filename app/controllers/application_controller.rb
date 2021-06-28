class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_cart

  def init_cart
    if user_signed_in?
      @order = Order.find_by(user: current_user, status: "cart")
      unless @order
        @order = Order.new(user: current_user)
        @order.save!
      end
    end
  end
end
