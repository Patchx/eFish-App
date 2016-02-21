class RemoveYahooFinances < ActiveRecord::Migration
  def change
  	drop_table :yahoo_finances
  end
end
