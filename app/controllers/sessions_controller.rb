class SessionsController < ApplicationController
	def create
		user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || 
		       User.create_with_omniauth(auth_hash)
		sign_in user, auth_hash
		redirect_to root_url 
	end

	def destroy
		sign_out
		redirect_to root_url
	end

	protected

	def auth_hash
		request.env["omniauth.auth"]
	end
end
