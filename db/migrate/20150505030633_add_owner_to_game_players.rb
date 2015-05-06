class AddOwnerToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :owner, :boolean
  end
end
