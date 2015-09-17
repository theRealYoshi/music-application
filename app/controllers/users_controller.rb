class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save!
      log_in_user!(@user)
      redirect_to user_path(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    render :show
  end


  private

    def user_params
      params.require(:user).permit(:email, :password)
    end


end
