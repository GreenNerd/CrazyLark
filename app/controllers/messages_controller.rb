class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    if @message.save
      if @message.seccode_match?    #if the message seccode is correct
        respond_to do |format|		
          format.json{ render :json => { success: true } }
        end
        #delete the record
        
      else
        respond_to do |format|
      	    format.json{ render :json => { error:-1 } }
      	  end
          #delete this record
      end
    else
      respond_to do |format|
        format.json { render :json => { error: -2} }
      end
    end
  end

  private

    def message_params
      params.permit(:mobile,:seccode)
    end
end
