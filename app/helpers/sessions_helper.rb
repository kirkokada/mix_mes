module SessionsHelper

	# Accepts user and OmniAuth hash as arguments
	def sign_in(user, auth_hash)
		remember_token = User.new_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attributes(remember_token: User.encrypt(remember_token),
			                     access_token: auth_hash["credentials"]["token"],
			                     refresh_token: auth_hash["credentials"]["refresh_token"])
		self.current_user = user
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def current_user
		remember_token = cookies[:remember_token]
		@current_user ||= User.find_by(remember_token: User.encrypt(remember_token))
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
		redirect_to root_path unless signed_in?
	end
end
