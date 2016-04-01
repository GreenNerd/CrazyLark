class SendMessage < ActiveRecord::Base
	after_create :write_in_random

	# validates :mobile, presence: true, numericality: true, length: { is:11 }
	# write in table
	def write_in_random
		self.seccode = SendMessage.random
		update_attribute(:created_at, Time.zone.now)
	end
	# twice sending with a interval of 1 minute 
	def seccode_expired?
		created_at < 1.minutes.ago
	end
	#get a random seccode
	def self.random
		code = rand(999999)
		if code != 0
			while code < 100000
				code *= 10
			end
		else
			code = "000000"
		end
		code.to_s
	end

	def xsend
		apikey = 'd0df698182f7f0bb9736c11d8e31a7b4'
		send_sms_uri = URI.parse('https://sms.yunpian.com/v1/sms/send.json')
		params = Hash.new 
		params['apikey'] = apikey
		params['mobile'] = mobile
		params['minute'] = '5'
		params['code'] = seccode
		params['text'] = '..WTK'
		
		response = Net::HTTP.post_form(send_sms_uri,params)
		print response.body + '\n'
	end
end
