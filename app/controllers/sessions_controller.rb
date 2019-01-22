class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.username}"
      redirect_to root_path
    else
      flash.now[:error] = "Username or password is invalid"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Bye o/"
    redirect_to login_path
  end
end