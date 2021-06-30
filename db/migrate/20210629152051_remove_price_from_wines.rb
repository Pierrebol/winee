class RemovePriceFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :price, :integer
  end
end
