class MobileValidatesController < ApplicationController
  def create
    @mobilevali = MobileValidate.new(mobile_params)
    if @mobilevali.save
      if @mobilevali.not_signed?
        respond_to do |format|
          format.json{ render :json => { success: true } }
        end
      else
        respond_to do |format|
          format.json{ render :json => { error: -2}}
        end
      end    

    else
      respond_to do |format|
        format.json{ render :json => { error:-1 } }
      end
    end
  end

  private
    def mobile_params
      params.permit(:mobile)
    end
end
