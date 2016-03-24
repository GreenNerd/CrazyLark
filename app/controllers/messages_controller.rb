class MessagesController < ApplicationController
require 'net/http'

	def new
		@message = Message.new
	end

	def send
		url = URI.parse('http://www.rubyinside.com/test.cgi')
		Net::HTTP.start(url.host, url.port) do |http|
		req = Net::HTTP::Post.new(url.path)
		req.set_form_data({ 'name' => 'David', 'age' => '24' })
		puts http.request(req).body
	end
end
