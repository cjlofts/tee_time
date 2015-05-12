class GamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @games = current_user.owned_games
    @invited_games = current_user.invited_games
    @requested_games = current_user.requested_games
    @all_games = Game.all
    @all_users_games = []

  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find params[:id]
    @invitation = GamePlayer.new
    @request = GamePlayer.new
    @invitables = User.order(:last_name).where.not(id: @game.owner.id)
  end

  def create
    ActiveRecord::Base.transaction do
      @game = Game.create(game_params)
      @game_player = current_user.game_players.new
      @game_player.game_id = @game.id
      @game_player.owner = true
      @game_player.status = "confirmed"
      @game_player.save
    end

    if @game_player.persisted?
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
    params.require(:game).permit(:golf_course_id, :date)
  end
end
