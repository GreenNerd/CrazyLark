class EmployeesController < ApplicationController
	def new
	end

	def create
		@employee = Employee.new(employee_param)
		@employee.save
		respond_to do |format|
			format.html{ redirect_to(employees_url) }
		end
	end

	def show
	end

	def index
		@employees = Employee.all
	end

	private
	  def  employee_param
	      params.permit(:name, :mac)
	  end
end
