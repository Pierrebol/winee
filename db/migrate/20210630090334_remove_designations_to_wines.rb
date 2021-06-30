class RemoveDesignationsToWines < ActiveRecord::Migration[6.0]
  def change
    remove_reference :wines, :designation, index: true, foreign_key: true
  end
end
