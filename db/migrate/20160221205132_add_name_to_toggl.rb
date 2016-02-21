class AddNameToToggl < ActiveRecord::Migration
  def change
    add_column :toggls, :name, :string
  end
end
