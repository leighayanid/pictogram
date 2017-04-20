class MyphotosController < ApplicationController
  def index
  	@photos = Photo.where(:user_id => current_user.id)
  end
end
