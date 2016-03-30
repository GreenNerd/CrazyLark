class EmployeesController < ApplicationController
	def login
	end

	def create
		@employee = Employee.new(employee_param)
		@employee.save
		respond_to do |format|
			format.json{ render :json => @employee }
		end
		redirect_to usermac_portal_path
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
