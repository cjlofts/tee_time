class RemoveTimeFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :time
    add_column :games, :date, :datetime
  end
end
