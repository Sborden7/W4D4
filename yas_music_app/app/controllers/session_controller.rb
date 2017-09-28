class SessionController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:errors] = ["You messed up your username and/or password!"]
      render :new
    else
      login_user!(user)
      render json: "your login worked! replace this with a real view"
    end
  end

  def destroy
    logout_user!
    render json: "your logout worked! replace this with a real view"
  end

end
