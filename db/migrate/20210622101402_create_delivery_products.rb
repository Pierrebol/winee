class CreateDeliveryProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_products do |t|
      t.string :quantity_of_wine
      t.references :delivery, null: false, foreign_key: true
      t.references :wine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
