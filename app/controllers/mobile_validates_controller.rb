class MobileValidatesController < ApplicationController
  def create
    @mobilevali = MobileValidate.new(mobile_params)
    if @mobilevali.save
      #see if mobile user applied has been signed.
      if @mobilevali.signed?
        respond_to do |format|
          format.json{ render :json => { error:-2 } }
        end
      else
        respond_to do |format|
          format.json{ render :json => { success:true } }
        end
      end    

    else
      #return error info
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
