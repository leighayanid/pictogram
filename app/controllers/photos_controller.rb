class PhotosController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
	before_action :find_photo, only: [:show,:edit, :update, :destroy, :upvote]
	load_and_authorize_resource param_method: :photo_params
	load_and_authorize_resource :through => :current_user, except: [:index]

  def index
  	@photos = Photo.all.order("created_at DESC").page(params[:page])
  end

  def show
  end

  def new
  	@photo = current_user.photos.build
  end

  def create
  	@photo = current_user.photos.build(photo_params)
  	if @photo.save
  		redirect_to @photo
  	else
  		render 'new'
  	end
  end

  def edit
  	
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    @photo.destroy
    flash[:notice] = 'Photo deleted.'
    redirect_to root_path
  end

  def upvote
    @photo.upvote_by current_user
    redirect_to :back
  end

  private

  def find_photo
  	@photo = Photo.find(params[:id])
  end

  def photo_params
  	params.require(:photo).permit(:title, :description, :image, :upvote)
  end

end
