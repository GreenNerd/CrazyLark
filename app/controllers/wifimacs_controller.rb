class WifimacsController < ApplicationController
  def show
    respond_to do |format|
      if Employee.find_by(mac: mac)
        format.json{ render :json => { legal: true } }      
      else
        format.json{ render :json => { legal: false } }     
      end      
  end
end
