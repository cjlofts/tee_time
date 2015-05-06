class AddStatusToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :status, :string
  end
end
