class AddStockIdToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :stockID, :string
  end
end
