class CommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    p = comment_params
    p["commenter"] = current_user.id
    @comment = @game.comments.create(p)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @comment = @game.comments.find(params[:id])
    @comment.destroy
    redirect_to game_path(@game)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end