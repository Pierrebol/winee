class StripeCheckoutSessionService
  def call(event)
    p '=========================================='
    order = Order.find_by(checkout_session_id: event.data.object.id)
    event.data.object.id
    order.update(status: 'paid')

    order.order_wines.each do |order_wine|
      p '======================================='
      if Winebox.find_by(wine_id: order_wine.wine.id, user_id: order.user.id).nil?
        @winebox = Winebox.new(quantity_of_wine: order_wine.quantity_of_wine)
        @winebox.user = order.user
        @winebox.wine = order_wine.wine
      else
        @winebox = Winebox.find_by(wine_id: order_wine.wine.id, user_id: order.user.id)
        @winebox.quantity_of_wine += order_wine.quantity_of_wine
      end
      @winebox.save!
    end
    p '======================================='
  end
end
