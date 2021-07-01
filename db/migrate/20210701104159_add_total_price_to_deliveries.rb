class AddTotalPriceToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_monetize :deliveries, :total_price, currency: { present: false }
  end
end
