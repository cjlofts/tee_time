class RemoveMinMaxAgesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :min_age, :integer
    remove_column :users, :max_age, :integer
  end
end
