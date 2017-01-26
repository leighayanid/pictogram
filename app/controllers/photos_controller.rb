class PhotosController < ApplicationController

	before_action :find_photo, only: [:create, :edit, :update, :destroy]

  def index
  	@photos = Photo.all
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
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
