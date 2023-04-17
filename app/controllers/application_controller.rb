class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to sessions_url, notice: "Not authenticated" unless current_user
  end
end
