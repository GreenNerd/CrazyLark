class SendMessageController < ApplicationController
require 'net/http'
	def new
		@note = SendMessage.new
	end
	
	def create
		@note = SendMessage.new(params[:id])
		if @note.save
			write_in
			send 
		else
			respond
		end
	end
	#get a random seccode
	def random
		rand(999999)
	end
	#write in table
	def write_in
		@message.seccode.random
	end
	
	def send
		#send message through API provided by XX firm
	end

end
