class CreateWineboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :wineboxes do |t|
      t.references :wine, null: false, foreign_key: true
      t.integer :quantity_of_wine
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
