class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :grape_variety
      t.string :vineyard
      t.text :description
      t.string :category
      t.integer :price
      t.string :photo
      t.string :country
      t.integer :year
      
      t.timestamps
    end
  end
end
