class SetupController < ApplicationController

  layout :false

  def index
   if user_signed_in?
   		redirect_to photos_path
   	end
  end

end
