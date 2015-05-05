class RemoveInvitedUserIdFromInvitations < ActiveRecord::Migration
  def change
    remove_column :invitations, :invited_user_id, :integer
  end
end
