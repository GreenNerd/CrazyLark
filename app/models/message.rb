class Message < ActiveRecord::Base
	validates :message, presence: true, numericality: true, length: { is:11 }
	validates :seccode, presence: true, numericality: true, length: { maximum:6 }
end
