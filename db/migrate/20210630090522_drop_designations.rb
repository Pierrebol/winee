class DropDesignations < ActiveRecord::Migration[6.0]
  def change
    drop_table :designations
  end
end
