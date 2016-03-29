class KeyValidateController < ApplicationController
	def new		
	end	

	def create
		@key_validate = KeyValidate.new(params[:id])
		valid_key
	end

	def valid_key
		if Key.where(:key => @key_validate).nil?
			respond_to do |format|
			#respond_to error info
		else
			#...
		end
	end
end
