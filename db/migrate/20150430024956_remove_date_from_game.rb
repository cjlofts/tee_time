class RemoveDateFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :date
  end
end
