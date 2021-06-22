class AddDesignationToWine < ActiveRecord::Migration[6.0]
  def change
    add_reference :wines, :designation, null: false, foreign_key: true
  end
end
