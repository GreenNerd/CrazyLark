class EmployeesController < ApplicationController
  before_action :authenticate_user!, only: [:index,:show,:update,:destroy]
  def new
    @corperation = Corperaton.find_by(:mac, params[:mac])
    @departments = corperation.departments
    respond_to do |format|
    	format.json{ render :json => @departments }
    end
  end

  def create
    @employee = Employee.new(employee_param)
    respond_to do |format|
      if @employee.save
        format.json{ render :json => { success: true } }
      else
        format.json{ render :json => { error: -1 } }
      end
    end
  end

  def index
    @employees = Employee.all 
    respond_to do |format|
      format.json{ render :json => @employees  }
    end
  end

  def show
    @employee = Employee.find(params[:id])
    @department_name = Department.find(@employee.department_id).name
    employee_record
    respond_to do |format|
  	  format.json{ render :json => { info: @employee,
                                                               department_name: @department_name,
                                                               records: @arr } }
    end
  end

  def update
    employee = Employee.find_by(id:params[:id])
    respond_to do |format|
      if employee.update(employee_param)
        format.json{ render :json => employee }
      else
        format.json{ render :json => { error: -1 } }
      end
    end
  end

  def destroy
    Employee.find(params[:id]).destroy
    respond_to do |format|
      format.json{ render :json => { success: true } }
    end
  end

  private
    def  employee_param
      params.permit(:id, :mobile, :name, :mac, :department_id,:year,:month)
    end

    def employee_record
    @arr = []
    i = 0
    Record.where(employee_id:params[:id]).each do |z|
      if z.date.month == params[:month].to_i && z.date.year == params[:year].to_i
        if z.status == 'normal' && z.pm_status == 'normal'
          @arr[i] = [z.date,'normal']
        elsif z.status == 'late'
          @arr[i] = [z.date,'late']
        elsif z.status == 'absence'  #+absence+
          @arr[i] = [z.date,'absence']
        elsif z.status == 'normal' && z.pm_status != 'normal'
          @arr[i] = [z.date,'run']
        end
        i += 1
      end
    end
  end  
end
