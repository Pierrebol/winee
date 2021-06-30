class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_cart
  before_action :init_delivery

  def init_cart
    if user_signed_in?
      @order = Order.find_by(user: current_user, status: "cart")
      unless @order
        @order = Order.new(user: current_user)
        @order.save
      end
    end
  end

  def init_delivery
    if user_signed_in?
      @delivery = Delivery.find_by(user: current_user, status: "delivery")
      unless @delivery
        @delivery = Delivery.new(user: current_user)
        @delivery.save
      end
    end
  end
end
