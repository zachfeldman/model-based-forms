class UsersController < ApplicationController
  def index
    @users = User.all
    session[:user_id] = 5
  end

  def show
    @user = User.find(params[:id])
    session[:hello]
  end

  def destroy
    @user = User.where(id: params[:id]).first
    if @user && @user.destroy
      flash[:notice] = "User #{@user.fname} destroyed."
    else
      flash[:alert] = "There was a problem deleting that user."
    end
    redirect_to "/users"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account was created successfully."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem creating your account."
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.where(id: params[:id]).first
    if @user && @user.update_attributes(params[:user])
      flash[:notice] = "User updated successfully."
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem updating that user."
      redirect_to :back
    end
  end
end