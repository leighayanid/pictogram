class PhotosController < ApplicationController

  def index
  	@photos = Photo.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def find_photo
  	@photo = Photo.find(params[:id])
  end

  def photo_params
  	params.require(:pic).permit(:title, :description)
  end

end
