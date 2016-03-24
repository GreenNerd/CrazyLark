class User < ActiveRecord::Base
	validates :mobile, presence: true, length: { is: 11 }, numericality: true,
				uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }
	#			format: { with VALID_PASSWORD_REGEX }
	#VALID_PASSWORD_REGEX = ^[a-zA-Z][a-zA-Z0-9_]{4,15}$
	has_secure_password
	
end
