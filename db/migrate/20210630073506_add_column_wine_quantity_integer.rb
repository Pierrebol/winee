class AddColumnWineQuantityInteger < ActiveRecord::Migration[6.0]
  def change
    add_column :delivery_products, :quantity_of_wine, :integer
  end
end
