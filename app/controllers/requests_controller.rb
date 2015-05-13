class RequestsController < ApplicationController

  def index
    @user_games = current_user.owned_games
  end

  def new
    games = Game.all
    @joinable_games = games.select { |game| game.joinable?(current_user) }
  end

  def decline
    game_player = GamePlayer.find params[:id]
    game_player.decline
    if game_player.save
      redirect_to requests_path
    end
  end

  def accept
    game_player = GamePlayer.find params[:id]
    game_player.accept
    if game_player.save
      redirect_to requests_path
    end
  end

  def create
    @game = Game.find params[:game_id]
    @request = @game.game_players.new
    @request.user_id = current_user.id
    @request.owner = false
    @request.status = "requested"

    if @request.save
      flash[:notice] = "Request Successful!"
      redirect_to new_request_path
    else
      flash[:notice] = "Request Unsuccessful"
      redirect_to game_path(@game)
    end
  end
end
