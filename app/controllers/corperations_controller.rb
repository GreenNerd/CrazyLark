class CorperationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @corperation = Corperation.new.(corperation_params)
    respond_to do |format|
      if @corperation.save
        format.json{ render :json => { success: true } }
      else
        format.json{ render :json => { error: -1 } }
      end
    end
  end

  def show
    @corperation = Corperation.find_by(corperation_params)
    @departments = @corperation.departments
    respond_to do |format|
      format.json{ render :json => @departments }
    end
  end

  private
      def corperation_params
        params.permit(:name,:mac)
      end
end
