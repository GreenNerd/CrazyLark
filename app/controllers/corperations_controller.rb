class CorperationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @corperation = Corperation.new(corperation_params)
    respond_to do |format|
      if @corperation.save
        #@corperation.create_new_days
        #@corperation.create_times
        format.json{ render :json => { success: true } }
      else
        format.json{ render :json => { error: -1 } }
      end
    end
  end

  def show
    @corperation = Corperation.find_by(corperation_params)
    @departments = @corperation.departments
    params = Hash.new 
    @departments.ids.each do |t|
      params[t] = Department.find(t).employees
    end
    respond_to do |format|
      format.json{ render :json => { corperation: @corperation, 
                                                     count: @departments.count,
                                                     departments: @departments,
                                                     employees: params } }
    end
  end

  private
      def corperation_params
        params.permit(:name,:mac)
      end
end
