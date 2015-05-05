class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = current_user.games
    @invited_games = current_user.invited_games
    @requested_games = current_user.requested_games
    @all_games = Game.all

    @all_users_games = []

    @games.each do |game|
      @all_users_games.push(game)
    end

    @invited_games.each do |game|
      @all_users_games.push(game)
    end

    @requested_games.each do |game|
      @all_users_games.push(game)
    end
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find params[:id]
    @request = @game.requests.new
    @invitation = @game.invitations.new
  end

  def create
    @game = current_user.games.new(game_params)
    if @game.save
      flash[:notice] = "Game created successfully!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Game not created"
      render :new
    end
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    find_game
    if @game.update(game_params)
      flash[:notice] = "Game successfully updated!"
      redirect_to game_path(@game)
    else
      flash[:alert] = "Game not updated"
      render :edit
    end
  end

  def destroy
    @game = Game.find params[:id]
    @game.destroy
    redirect_to games_path
    flash[:notice] = "Game successfully deleted"
  end

  private

  def find_game
    @game = Game.find params[:id]
  end

  def game_params
    params.require(:game).permit(:user_id, :golf_course_id, :date)
  end

end
