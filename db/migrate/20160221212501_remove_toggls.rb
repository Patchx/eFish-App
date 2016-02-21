class RemoveToggls < ActiveRecord::Migration
  def change
  	drop_table :toggls
  end
end
