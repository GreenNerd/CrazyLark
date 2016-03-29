class SendMessageController < ApplicationController
require 'net/http'
	def new
		@note = SendMessage.new
	end
	#get post and create 
	def create
		@note = SendMessage.new(params[:id])
		if @note.save
			@note.write_in_random
			@note.send 
		else
			respond
		end
	end

	#send message to third party API
	def send
		#send message through API provided by XX firm
	end

	def resend
		if check_expiration
			send
	end

	private
		def check_expiration
			if seccode_expired?
				#allow to resend.return true
			else
				#forbid resend.
			end
		end

end
