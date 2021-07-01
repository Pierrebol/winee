class AddCheckoutSessionIdToDeliveries < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :checkout_session_id, :string
  end
end
