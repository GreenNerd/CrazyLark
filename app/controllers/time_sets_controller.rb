class TimeSetsController < ApplicationController
  def update
    respond_to do |format|
      if time = TimeSet.find_by(timeset_params)
        if time.update(timeset_params)
          format.json{ render :json => { success: true } }
        end
      else
          format.json{ render :json => { error: -1 } }
      end      
    end
  end

  private
     def timeset_params
       params.permit(:corperation_id,:start,:arrive,:late,:run,:leave,:finish)
     end
end
