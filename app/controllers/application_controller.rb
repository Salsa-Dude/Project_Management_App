class ApplicationController < ActionController::Base
  helper_method :current_user

  def index 

  end

  def current_user
    if @current_user
      @current_user
    else
      @current_user = user.find_by(id: session[:user_id])
      if @current_user
        @current_user = @current_user.username
      end
    end
  end
end
