class	GraphAPI
	include HTTParty

	base_uri "api.mixi-platform.com/2"

	def self.get_received_messages(user)
		get("/messages/@me/@inbox", headers: auth_header(user)).parsed_response
	end

	def self.get_sent_messages(user)
		get("/messages/@me/@outbox", headers: auth_header(user)).parsed_response
	end

	def self.auth_header(user)
		{ 'Authorization' => "Bearer #{user.access_token}" }
	end
end