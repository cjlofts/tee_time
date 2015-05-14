class AddHandicapFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :min_handicap, :integer
    add_column :users, :max_handicap, :integer
  end
end
