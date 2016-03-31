class SendMessageController < ApplicationController
require 'net/http'
require 'uri'
	def new
		@note = SendMessage.new
	end
	#get post and create 
	def create
		@note = SendMessage.new(params[:id])
		if @note.save
			@note.write_in_random
			respond_to do |random|
				random.json{ render :json=> @note }	
			end
			send 
		else
			respond
		end
	end

	def send
		apikey = 'd0df698182f7f0bb9736c11d8e31a7b4'
		mobile = @note.mobile
		text = @note.seccode

		send_sms_uri = URI.parse('https://sms.yunpian.com/v1/sms/send.json')

		params['apikey'] = apikey
		params['mobile'] = mobile
		params['text'] = text
		
		response = Net::HTTP.post_form(send_sms_uri,params)
		print response.body + '\n'
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
