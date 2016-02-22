class AddTogglwidToUser < ActiveRecord::Migration
  def change
    add_column :users, :toggl_wid, :string
  end
end
