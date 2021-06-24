class AddNameToDesignations < ActiveRecord::Migration[6.0]
  def change
    add_column :designations, :name, :string
  end
end
