class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.json{ render :json => @user.id}
      end
    else
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
    params.require(:user).permit(:mobile, :message, :password, :key,
                                                  :password_confirmation)
  end
  
end
