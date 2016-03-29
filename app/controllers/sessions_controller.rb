class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(mobile: params[:session][:mobile])
		if user && user.authenticate(params[:session][:password])
			log_in user 
		else
			#respond_to error_info
		end
	end

	def destroy
		log_out
	end
end
