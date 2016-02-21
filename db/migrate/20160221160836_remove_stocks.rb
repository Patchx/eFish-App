class RemoveStocks < ActiveRecord::Migration
  def change
  	drop_table :stocks
  end
end
