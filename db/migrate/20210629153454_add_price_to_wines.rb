class AddPriceToWines < ActiveRecord::Migration[6.0]
  def change
    add_monetize :wines, :price, currency: { present: false }
  end
end
