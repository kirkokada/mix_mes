class Message < ActiveRecord::Base

	belongs_to :user

	def self.get_messages(user)
		messages = GraphAPI.get_received_messages(user)
		messages["Entry"].each do |message|
			user.messages.build(mid: message["id"],
				                  time_sent: message["time_sent"],
				                  body: GraphAPI.get_message_body(message["id"]),
				                  conversant_id: message["sender"]["id"])
		end
	end


	def last_update(user)
		user.messages.last.created_at || ""
	end
end
