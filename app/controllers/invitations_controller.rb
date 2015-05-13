class InvitationsController < ApplicationController

  def index
    @invitations = current_user.invitations
  end

  def decline
    game_player = GamePlayer.find params[:id]
    game_player.decline
    if game_player.save
      InvitationsMailer.decline_invitation(game_player).deliver_now
      redirect_to invitations_path, notice: "Invitation Declined"
    end
  end

  def accept
    game_player = GamePlayer.find params[:id]
    game_player.accept
    if game_player.save
      InvitationsMailer.accept_invitation(game_player).deliver_now
      redirect_to invitations_path, notice: "Invitation Accpeted!"
    end
  end

  def create
    @game = Game.find params[:game_id]
    @invitation = @game.game_players.new(invitation_params)
    @invitation.owner = false
    @invitation.status = "invited"

    if @invitation.save
      InvitationsMailer.notify_invited_person(@invitation).deliver_now

      flash[:notice] = "Invitation Sent!"
      redirect_to @game
    else
      flash[:alert] = "Invitation Not Sent"
      redirect_to @game
    end
  end

  private

  def invitation_params
    params.require(:game_player).permit(:user_id)
  end

end
