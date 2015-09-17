class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      #login!(@user)
      #redirect_to index
    else
      flash[:notice] = "jdfklajkldajglkajgad"
      render :new
    end
  end



  def user_params
    params.require(:user).permit(:email, :password)
  end


end
