class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(mobile: create_params[:mobile])
		if user && user.authenticate(create_params[:password])
			# self.current_user = @user
			# log_in user
			respond_to do |format|
				format.json{ render :json => user }
			end	
		else
			respond_to do |format|
				format.json{ render :json => {error:-1} }
			end
		end
	end

	def destroy
		log_out
	end

	private
		def create_params
			params.require(:user).permit(:mobile, :password, :message)
		end
end
