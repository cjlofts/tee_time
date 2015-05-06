class InvitationsController < ApplicationController

  def create
    ActiveRecord::Base.transaction do
      game = Game.find params[:game_id]
      @invitation = game.invitations.create!(invitation_params)
      @game_player = game.game_players.new(invitation_params)
      @game_player.owner = false
      @game_player.status = "invited"
      @game_player.save!
    end

    if @game_player.persisted?
      flash[:notice] = "Invitation Sent!"
      redirect_to games_path
    else
      flash[:alert] = "Invitation Not Sent"
      render game_path
    end
  end

  private

  def invitation_params
    params.require(:invitation).permit(:user_id)
  end

end
