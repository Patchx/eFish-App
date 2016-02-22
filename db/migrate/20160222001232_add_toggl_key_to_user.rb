class AddTogglKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :toggl_key, :string
  end
end
