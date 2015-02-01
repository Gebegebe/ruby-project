class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
 
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def update
    @game = Game.find(params[:id])
   
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
   
    redirect_to games_path
  end

  def rent
    @game = Game.find(params[:id])
    if @game.is_rented?
      flash.now[:danger] = "Game is already rented!"
    else
      @game.is_rented = 1
      if !@game.save
        flash[:danger] = "There was an error while renting game. Try again, or contact us."
      else
        flash[:success] = "Game rented !"
      end
    end
    redirect_to @game
  end

  def unrent
    @game = Game.find(params[:id])
    if !@game.is_rented?
      flash.now[:danger] = "Game isn't rented!"
    else
      @game.is_rented = 0
      if !@game.save
        flash[:danger] = "There was an error while returning game. Try again, or contact us."
      else
        flash[:success] = "Game returned !"
      end
    end
    redirect_to @game
  end

  private
  def game_params
    params.require(:game).permit(:title, :description)
  end
end
