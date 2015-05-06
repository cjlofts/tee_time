class RequestsController < ApplicationController

  def index
    @new_requests = current_user.requested_users
  end

  def show
  end

  def create
    ActiveRecord::Base.transaction do
      @game = Game.find params[:game_id]
      @request = @game.requests.new
      @request.user_id = current_user.id
      @request.save!
      @game_player = @game.game_players.new
      @game_player.user_id = current_user.id
      @game_player.owner = false
      @game_player.status = "requested"
      @game_player.save!
    end

    if @request.persisted?
      flash[:notice] = "Request Successful!"
      redirect_to games_path
    else
      flash[:notice] = "Request Unsuccessful"
      redirect_to game_path(@game)
    end
  end
end
