class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    if User.take == nil then admin = 1 end
    @user = User.new(user_params)
    if @user.save
      @user.is_admin = admin
      @user.save
      log_in @user
      flash[:success] = "Welcome to Game Rental!"
      redirect_to games_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
