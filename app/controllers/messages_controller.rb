class MessagesController < ApplicationController
	before_action :check_expiration
	def new
		@message = Message.new	
	end

	def create
		@message = Message.new(params[:id])
		if seccode_match?
			respond_to do |format|				#any auth_token return?!!
				format.json{ render :json => {}}
			end
		else
			#error
		end
	end

	def seccode_match?
		if @message.seccode == @note.seccode
			return true
		else
			# respond_to do |format| #something like that.
				# format.json{ render :json => { error:(status: -1) }}
			# end
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
