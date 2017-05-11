class UsersController < ApplicationController
	load_and_authorize_resource through: :current_user
	load_and_authorize_resource param_methods: :user_params

	def index
		
	end

	def show
	end

end
