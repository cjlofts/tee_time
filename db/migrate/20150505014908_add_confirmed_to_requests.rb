class AddConfirmedToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :confirmed, :boolean
  end
end
