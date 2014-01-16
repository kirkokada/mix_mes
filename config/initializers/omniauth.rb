Rails.application.config.middleware.use OmniAuth::Builder do
	provider :mixi, 'f80e8aeed0faa205a976', 'f449d930c96f04457b79191872fae9d3bdd4865d', 
	                { scope: "r_profile r_profile_name r_profile_location r_profile_about_me r_message w_message" }
end