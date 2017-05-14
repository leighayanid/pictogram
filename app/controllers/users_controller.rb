class UsersController < ApplicationController
	before_action :find_user, except: :index
	load_and_authorize_resource through: :current_user, except: [:index, :show]
	load_and_authorize_resource param_methods: :user_params

	def index
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true).page(params[:page]).per(10)
	end

	def show
		
	end

	def find_user
		@user = User.friendly.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:first_name)
	end

end
