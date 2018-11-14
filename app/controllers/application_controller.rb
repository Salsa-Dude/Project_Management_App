class ApplicationController < ActionController::Base
   helper_method :current_user
   helper_method :logged_in?
   helper_method :authorized


  def index
  end

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to users_path unless logged_in?
  end

  def authorized_for_user(user)
    authorized
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end

  def bad_route_redirect
    redirect_to users_path
  end

end
