class AddColumnToWinebox < ActiveRecord::Migration[6.0]
  def change
    add_column :wineboxes, :pick_up_address, :string
    add_column :wineboxes, :pick_up_date, :datetime
  end
end
