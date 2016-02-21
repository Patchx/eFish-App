class CreateYahooFinances < ActiveRecord::Migration
  def change
    create_table :yahoo_finances do |t|

      t.timestamps null: false
    end
  end
end
