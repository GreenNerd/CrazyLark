class CalendarsController < ApplicationController

  def create
    respond_to do|format|
      if @calendar = Calendar.new(calendar_params)
        if @calendar.day.sunday? || @calendar.day.saturday?
          format.json{ render :json => { holiday: true } }
        else
          format.json{ render :json => { holiday: false } }
        end
      else
        format.json{ render :json => { error: -1 } }
      end
    end
  end

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
    @days = Calendar.where(month: params[:id], corperation_id: params[:corperation_id])
    respond_to do |format|
      format.json{ render :json => @days }
    end
  end

  private
    def calendar_params
      params.permit(:day,:dayoff,:corperation_id)
    end
end
