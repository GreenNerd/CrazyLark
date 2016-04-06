class KeyValidatesController < ApplicationController
  def create
    @keyvali = KeyValidate.new(params[:id])
    if @keyvali.buy?
      respond_to do |format|
        format.json{ render :json => { success: true } }
      end
    else
      respond_to do |format|
        format.json{ render :json => { error:-1 } }
      end
  end

  def buy?
    if Cdkey.find_by(key: key)
      true
    else
      false
    end
end
