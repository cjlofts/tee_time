class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find params[:id]
  end

  def create
    @game = Game.new(game_params)
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
