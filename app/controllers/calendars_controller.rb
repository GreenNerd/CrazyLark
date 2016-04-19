class CalendarsController < ApplicationController

  def update
    respond_to do |format|
      if calendar = Calendar.find_by(day: calendar_params[:day])
        if calendar.update(calendar_params)
          format.json{ render :json => { success: true} }
        else
          format.json{ render :json => { error: -1 } }
        end
      else
        format.json{ render :json => { error: -2 } }
      end
  end

  def show
    @days = Calendar.where(month: params[:id])
    respond_to do |format|
      format.json{ render :json => @days }
    end
  end


  private
    def calendar_params
      params.permit(:day,:dayoff,:corperation_id)
    end
end
