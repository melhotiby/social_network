class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Successfully created your user profile!"
      redirect_to new_user_photo_path(@user)
    else
      render :new
    end
  end
end
