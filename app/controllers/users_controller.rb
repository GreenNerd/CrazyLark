class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user 
			#redirect_to root_url
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.json{ render :json => @user }
		end
	end

	def index
		@users = User.all
		respond_to do |format|
			format.json{ render :json => @users }
		end
	end

	private

		def user_params
			params.require(:user).permit(:mobile, :message, :password,
										 :password_confirmation)
		end
end
