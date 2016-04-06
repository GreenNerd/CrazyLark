class KeyValidatesController < ApplicationController
  def create
    @keyvali = KeyValidate.new(keyvali_params)
    if @keyvali.save
      if @keyvali.buy?
        respond_to do |format|
          format.json{ render :json => { success: true } }
        end
      else
        respond_to do |format|
          format.json{ render :json => { error:-1 } }
        end
      end
    else
      respond_to do |format|
        format.json { render :json => { error:-2 } }
      end
    end
  end

  private
    def keyvali_params
      params.permit(:key)
    end
end
