class StripeCheckoutSessionService
  def call(event)
    session = Stripe::Checkout::Session.retrieve({
      id: event[:data][:object][:id],
      expand: ['line_items']
    })

    if session[:line_items][:data].first[:description] == "order"
      order = Order.find_by(checkout_session_id: event.data.object.id)
      order.update(status: 'paid')

      order.order_wines.each do |order_wine|
        if Winebox.find_by(wine_id: order_wine.wine.id, user_id: order.user.id).nil?
          @winebox = Winebox.new(quantity_of_wine: order_wine.quantity_of_wine)
          @winebox.user = order.user
          @winebox.wine = order_wine.wine
        else
          @winebox = Winebox.find_by(wine_id: order_wine.wine.id, user_id: order.user.id)
          @winebox.quantity_of_wine += order_wine.quantity_of_wine
        end
        @winebox.save
      end
    else
      delivery = Delivery.find_by(checkout_session_id: event.data.object.id)
      delivery.update(status: 'paid')

      delivery.delivery_products.each do |delivery_product|
        @winebox = Winebox.find_by(wine_id: delivery_product.wine.id, user_id: delivery.user.id)
        @winebox.quantity_of_wine -= delivery_product.quantity_of_wine
        @winebox.save
      end
    end
  end
end
