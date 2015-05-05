class InvitationsController < ApplicationController

  def create
    game = Game.find params[:game_id]
    @invitation = game.invitations.new(invitation_params)
    if @invitation.save
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
