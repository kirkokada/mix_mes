class MessagesController < ApplicationController
	before_filter :signed_in_user

	def index
		response = GraphAPI.get_received_messages(current_user)
		@messages = response["entry"]
	end
end
