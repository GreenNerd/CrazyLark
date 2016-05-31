class CalendarsController < ApplicationController
  def create
    params.permit!

    respond_to do |format|
      whatday = params[:day]
      date = Date.new(whatday[0].to_i,whatday[1].to_i,whatday[2].to_i)
      if params[:dayoff].to_i == 1
        dayoff = false
      elsif params[:dayoff].to_i == 2
        dayoff = true
      end
      if @calendar = Calendar.create(corperation_id: params[:corperation_id],day:date,dayoff:dayoff)
        if @calendar.day.sunday? || @calendar.day.saturday?
          @calendar.update(holiday:true)
        else
          @calendar.update(holiday:false)
        end
        format.json{ render :json => { success: true } }
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
  end

  def index
    @days = Calendar.where(corperation_id: params[:corperation_id])
    response = []
    count = 0
    @days.each do |x|
      if x.day.year == params[:year].to_i
        response[count] = [count.to_s,x.day.to_s,x.dayoff]
        count += 1  
      end
    end
    respond_to do |format|
      format.json{ render :json => response }
    end
  end
end
