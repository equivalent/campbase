class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
  end

  def login
    user = User.find(params[:id])
    if user
      session[:user_id] = user.id
      redirect_to projects_path, notice: "Logged in!"
    end
  end

  def logout
    reset_session
    redirect_to root_path, notice: "Logged out!"
  end
end
