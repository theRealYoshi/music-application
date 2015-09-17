class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    log_in_user!(user)
    redirect_to user_path(user)
  end

  def destroy
    logout!
    redirect_to users_path
  end
end
