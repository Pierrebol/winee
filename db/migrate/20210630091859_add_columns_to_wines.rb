class AddColumnsToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :hachette_description, :string
    add_column :wines, :designation, :string
    add_column :wines, :service, :string
    add_column :wines , :designation_description, :string
  end
end
