class MessagesController < ApplicationController
	def new
		@message = Message.new	
	end

	def seccode_match?
		if @message.seccode == @@note.seccode
			return true
		else
			# respond_to do |format| #something like that.
				# format.json{ render :json => { error:(status: -1) }}
			# end
		end
	end

	def create
		@message = Message.new(params[:id])
		if seccode_match?(@message)
			respond_to do |format|				#any auth_token return?!!
				format.json{ render :json => {}}
			end
		else
			#error
		end
	end
end
