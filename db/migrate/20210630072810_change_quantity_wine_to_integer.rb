class ChangeQuantityWineToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :delivery_products, :quantity_of_wine
  end
end
