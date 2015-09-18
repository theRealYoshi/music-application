class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    log_in_user!(user)
    redirect_to bands_url
  end

  def destroy
    logout!
    redirect_to users_path
  end
end
