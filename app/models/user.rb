class User < ActiveRecord::Base
	validates_uniqueness_of :uid, :scope => [:provider]

	before_create { generate_token(:remember_token) }

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["info"]["name"]
		end
	end

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def self.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

	def generate_token(column)
		begin
			self[column] = User.encrypt(User.new_token)
		end while User.exists?(column => self[column])
	end
end
