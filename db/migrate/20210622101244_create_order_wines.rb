class CreateOrderWines < ActiveRecord::Migration[6.0]
  def change
    create_table :order_wines do |t|
      t.integer :quantity_of_wine
      t.references :order, null: false, foreign_key: true
      t.references :wine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
