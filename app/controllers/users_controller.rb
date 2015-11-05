class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #@user = User.find_by_name(:name)
  end


  def new
    @user = User.new
  end
  
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Sample App - Live the dream!!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
end
