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
end
