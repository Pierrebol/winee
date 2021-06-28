class AddAddressToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :delivery_address, :string
  end
end
