class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    Contact.find(session[:user_id])
  end

  def choose_user
  end

  def init_user
    session[:user_id] = params[:user_id]
    redirect_to "/espace/"
  end

end
