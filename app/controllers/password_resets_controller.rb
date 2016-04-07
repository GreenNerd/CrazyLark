class PasswordResetsController < ApplicationController
  #user send_message api.
  def create
    @user = User.find_by(password_reset_params)
      if @user.seccode_is_right?
        @user.
        @user.
      else
        
      end
  end

  private
    def password_reset_params
      params.permit(:mobile,:reset_token)
    end

    def get_user
      @user = User.find_by(mobile: password_reset_params[:mobile])
    end
end
