class RemoveRequestedUserIdFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :requested_user_id, :integer
  end
end
