class AddDefaultValueStatusToDelivery < ActiveRecord::Migration[6.0]
  def change
    add_column :deliveries, :status, :string, default: "delivery"
  end
end
