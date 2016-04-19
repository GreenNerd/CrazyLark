class DepartmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  # before_action :correct_user, only: [:create,:destroy]
  def create
    @department = Department.new.(department_params)
    respond_to do |format|
      if @department.save
        format.json{ render :json =>  { success: true } }
      else
        format.json{ render :json => { error: -1 } }
      end
    end
  end

  def index
    @departments = Department.all
    # @department.quantity
    respond_to do |format|  
      format.json{ render :json =>  @departments  }
    end
  end

  def show
    @department = Department.find_by(department_params)
    @employees = @department.employees
    # @department.quantity
    respond_to do |format|
      format.json{ render :json => @employees  }
    end
  end

  def quantity
    respond_to do |format|
      format.json{ render :json =>  self.employees.count  }
    end
  end

  def destroy
    
  end

  private
    def department_params
      params.permit(:corperation,:name)
    end
end
