Rails.application.config.middleware.use OmniAuth::Builder do
	provider :mixi, 'f80e8aeed0faa205a976', 'f449d930c96f04457b79191872fae9d3bdd4865d'
end