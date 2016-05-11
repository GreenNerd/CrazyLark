class MainPagesController < ApplicationController
  def show
    Corperation.find(main_params[id]).departments.each do |x|
      x.employees.each do |y|
        y.records.each do |z|
          z.date == Date.today
        end
      end
    end   
    @clocks = Record.where(date: Date.today)
    come_count = 0
    late_count = 0
    absence_count = 0
    run_count = 0
    normal_count = 0
      
    @clocks.each do |record|

      if  record.status == 'normal'
        come_count += 1 
      elsif record.status == nil || record.status == 'late'
        late_count += 1  
      elsif record.status == 'absence' || #and no record employee who never come .
        absence_count += 1
      end 

      if record.pm_status == 'flag' && record.pm_status == 'nil'
        run_count += 1 
      elsif record.pm_status == 'normal' && record.status == 'normal'  
        normal_count += 1
      end

    end

    respond_to do |format|
      format.json{ render :json => { come: come_count, 
                                                      late: late_count,
                                                      absence: absence_count,
                                                      run: run_count,
                                                      normal: normal_count } }
    end
  end

  private
    def main_params
      params.permit(:date,:corperation_id)
    end
end
