class RequestsController < ApplicationController

  def create
    game = Game.find (params[:game_id])
    @request = game.requests.new
    @request.user_id = current_user.id
    if @request.save
      flash[:notice] = "Request Successful!"
      redirect_to games_path
    else
      flash[:notice] = "Request Unsuccessful"
      redirect_to game_path
    end
  end

end
