class AddEmailUniqueToToggl < ActiveRecord::Migration
  def change
    add_column :toggls, :email, :string
    add_index :toggls, :email, unique: true
  end
end
