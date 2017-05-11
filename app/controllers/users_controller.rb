class UsersController < ApplicationController
	load_and_authorize_resource through: :current_user, except: [:index, :show]
	load_and_authorize_resource param_methods: :user_params

	def index
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
	end

	def show
		
	end

	def user_params
		params.require(:user).permit(:first_name)
	end

end
