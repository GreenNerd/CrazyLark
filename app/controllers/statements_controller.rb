class StatementsController < ApplicationController
  def show
    respond_to do |format|
      generate_statement
      if @forms = Statement.find_by(corperation_id: statement_params[:id],year: statement_params[:year],month: statement_params[:month])
        format.json{ render :json => eval(@forms.status) }
      else        
        format.json{ render :json => { error: "unknown bug"} }
      end
    end
  end

  private
  def generate_statement
    if Statement.find_by(corperation_id: statement_params[:id],year: statement_params[:year],month: statement_params[:month]).nil?
      Statement.create(corperation_id: statement_params[:id],year: statement_params[:year],month: statement_params[:month])
      write_record
    else
      # @table = Statement.find_by(corperation_id: statement_params[:id],year: statement_params[:year],month: statement_params[:month])
      # if @table.updated_at < 24.hours.ago
        write_record  #update statement
      # end
    end
  end

  def write_record
    @statement = Hash.new
    Corperation.find(statement_params[:id]).departments.ids.each do |x|
      Department.find(x).employees.ids.each do |y|
        @attendance_count = 0
        @late_count = 0
        @absence_count = 0
        @run_count = 0
        name = Employee.find(y).name
        Record.where(employee_id:y).each do |z|
          if z.date.month == statement_params[:month].to_i && z.date.year == statement_params[:year].to_i
            if z.status == 'normal' && z.pm_status == 'normal'
              @attendance_count += 1
            elsif z.status == 'late'
              @late_count += 1
            elsif z.status == 'absence'  #+absence+
              @absence_count += 1
            elsif z.status == 'normal' && z.pm_status == 'flag'
              @run_count += 1
            end
          end
        end
        #when someone nerver came someday, there won'y be any records in database.
        #so it's neccessery to add these days into absence counts.
        @statement["#{y}"] = [@attendance_count,@late_count,@absence_count,@run_count,Employee.find(y).department.name,name]
      end
    end
    Statement.find_by(year:statement_params[:year].to_i,month:statement_params[:month].to_i,corperation_id:statement_params[:id].to_i).update(status:@statement.to_s)
  end


  def statement_params
    params.permit(:id,:year,:month)
  end
end
