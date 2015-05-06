class AddConfirmedToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :confirmed, :boolean
  end
end
