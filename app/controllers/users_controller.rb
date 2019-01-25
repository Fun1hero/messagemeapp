class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages[0]
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages[0]
      render "edit"
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    session[:user_id] = nil
    @user.destroy
    flash[:danger] = "User have been deleted"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :color)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      # flash[:danger] = ""
      redirect_to root_path
    end
  end

end
