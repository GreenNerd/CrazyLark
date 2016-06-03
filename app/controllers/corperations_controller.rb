class CorperationsController < ApplicationController
  before_action :authenticate_user!, only: [:create,:show]
  def create
    if current_user.corperation_id.nil?
      corper = Corperation.new(name:corperation_params[:name],mac:Cdkey.find_by(key:current_user.key).mac)
      respond_to do |format|
        if corper.save
          current_user.update(corperation_id:corper.id)
          format.json{ render :json => { success:true } }
        else
          format.json{ render :json => { error: -1 } }
        end
      end
    else
      api_error(status: 403)
    end
  end

  def show
    begin
      @corperation = Corperation.find(current_user.corperation_id)
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
    rescue 
      api_error(status: 404)
    end
  end

  private
      def corperation_params
        params.permit(:name,:mac)
      end
end
