class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
<<<<<<< HEAD
    @user.save
    session[:user_id] = @user.id
    redirect_to users_path
=======
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to projects_path
    else 
      render :new
    end
>>>>>>> validation
  end


  private
  def user_params
    params.require(:user).permit(:name, :username, :email)
  end
end
