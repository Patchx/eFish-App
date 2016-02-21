class CreateToggls < ActiveRecord::Migration
  def change
    create_table :toggls do |t|

      t.timestamps null: false
    end
  end
end
