class AddFilenameToStatistic < ActiveRecord::Migration
  def change
    add_column :statistics, :filename, :string
  end
end
