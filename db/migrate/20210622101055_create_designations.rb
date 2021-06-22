class CreateDesignations < ActiveRecord::Migration[6.0]
  def change
    create_table :designations do |t|
      t.text :description
      t.string :region

      t.timestamps
    end
  end
end
