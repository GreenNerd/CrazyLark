class EmployeesController < ApplicationController

  def new
    @corperation = Corperaton.find_by(:mac, params[:mac])
    @departments = corperation.departments
    respond_to do |format|
    	format.json{ render :json => { @departments } }
  end

  def create
    @employee = Employee.new(employee_param)
    @employee.save
    respond_to do |format|
      format.html{ redirect_to(employees_url) }
    end
  end

  def show
  	@employee = Employee.find_by(params[:id])
  	respond_to do |format|
  	  format.json{ render :json => { @employee } }
  	end
  end

  private
    def  employee_param
      params.permit(:name, :mac)
    end
end
