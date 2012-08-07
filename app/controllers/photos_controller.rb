class PhotosController < ApplicationController
  before_filter :the_user
  respond_to :html, :json

  def new
    @photo = Photo.new
    respond_with @photo
  end

  def create
    @photo = @user.photos.new(params[:photo])
    unless @photo.save
      render :json => { "errors" => @photo.errors }
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

  private

    def the_user
       @user = User.find(params[:user_id])
    end

end
