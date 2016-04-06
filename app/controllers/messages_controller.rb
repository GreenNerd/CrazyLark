class MessagesController < ApplicationController
  def new
    @message = Message.new	
  end

  def create
    @message = Message.new(params[:id])
    if seccode_match?
      respond_to do |format|		
        format.json{ render :json => { success: true } }
      end
    else
      respond_to do |format|
      	  format.json{ render :json => { error: -1 } }
      	end
    end
  end

  def seccode_match?
    if SendMessage.find_by(mobile:@message.mobile)
      if @message.seccode == SendMessage.find_by(mobile:@message.mobile).seccode
         true
      else
      	  false
      end
    else
    	false
    end
  end

  def check_expiration
    if seccode_expired?
      respond_to do |format|
        #json {error}
        #redirect_to signup_url
      end
    end
  end
end
