class SessionsController < ApplicationController

  def create
    user = User.find_by(mobile: params[:mobile])
    if user && user.authenticate(params[:user][:password])
      self.current_user = user
      respond_to do |format|
        format.json{ render :json => { token:user.authentication_token } }
      end	
    else
      respond_to do |format|
  	  format.json{ render :json => { error:-1 } }
      end
    end
  end

  def destroy
  	log_out
  end

  # private
    # def create_params
      # params.req.permit(:mobile, :password)
    # end
end
