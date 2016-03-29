class SendMessage < ActiveRecord::Base
	validates :message, presence: true, numericality: true, length: { is:11 }

	#get a random seccode
	def random
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
	#write in table
	def write_in_random
		@note.seccode.random
		update_attribute(:send_at, Time.zone.now)
	end
	#twice sending with a interval of 1 minute 
	def seccode_expired?
		send_at < 1.minutes.ago
	end
end
