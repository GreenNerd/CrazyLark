class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(mobile: params[:mobile])
		if user && user.authenticate(params[:password])
			respond_to do |format|
				format.json{ render :json => {success:true,token:12346789} }
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
end
