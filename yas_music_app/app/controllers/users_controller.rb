class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      render json: "it worked!"
    else
      render :new
    end

  end

  def new
    @user = User.new
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
