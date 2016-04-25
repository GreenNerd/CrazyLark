class EmployeesController < ApplicationController

  def new
    @corperation = Corperaton.find_by(:mac, params[:mac])
    @departments = corperation.departments
    respond_to do |format|
    	format.json{ render :json => @departments }
    end
  end

  def create
    @employee = Employee.new(employee_param)
    @employee.save
    respond_to do |format|
      format.html{ redirect_to(employees_url) }
    end
  end

  def index
    @employees = Employee.all 
    respond_to do |format|
      format.json{ render :json => @employees  }
    end
  end
  
  def edit
    @employee = Employee.find(params[:id])  
  end

  def show
    @employee = Employee.find(params[:id])
    @department_name = Department.find(@employee.department_id).name
    respond_to do |format|
  	  format.json{ render :json => { info: @employee,
                                                        department_name: @department_name } }
    end
  end

  def update
    employee = Employee.find_by(id:params[:id])
    respond_to do |format|
      if employee.update(employee_param)
        format.json{ render :json => { success: true } }
      else
        format.json{ render :json => {error: -1} }
      end
    end
  end

  def destroy
    Employee.find(params[:id]).destroy
    respond_to do |format|
      format.json{ render :json => {  } }
    end
  end

  private
    def  employee_param
      params.permit(:id, :mobile, :name, :mac, :department_id)
    end
end
