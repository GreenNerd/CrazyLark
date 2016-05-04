class ApplicationController < ActionController::Base
 
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # disable the CSRF token
  skip_before_action :verify_authenticity_token

  before_action :destroy_session
  include SessionsHelper
  attr_accessor :current_user
  
  def destroy_session
  	request.session_options[:skip] = true
  end
  
  # def authenticate_user!
  #   header
  #   params
    
  #   token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
  #   # fetch the token from http request
  #   user.mobile = options.black? nil : options[:mobile]
  #   user = user_mobile && User.find_by(mobile: user_mobile)

  #   if user && ActiveSupport::SecurityUtils.secure_compare(user.authenticate_token, token)
  #     self.current_user = user
  #   else
  #     return unauthenticated!
  #   end
  # end

  # def unauthenticated!
  #   respond_to do |format|
  #     format.json{ render :json => { error: unlogged } }
  #   end
  # end

end
