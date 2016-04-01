class SendMessagesController < ApplicationController
require 'net/http'
require 'uri'

	#get post and create 
	def create
		@note = SendMessage.new(send_message_param)
		if @note.save
			respond_to do |format|
				format.json{ render :json => @note }	
			end
			@note.xsend
		else
			respond_to do |error|
				error.json{ render :json => {error:-1}}
			end
		end
	end

	# def resend
		# if check_expiration
			# send
		# end
	# end

	private
		# def check_expiration
			# if seccode_expired?
				# allow to resend.return true
			# else
				#forbid resend.
			# end
		# end

		def send_message_param
			params.permit(:mobile)
		end

end
