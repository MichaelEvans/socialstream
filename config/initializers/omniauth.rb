Rails.application.config.middleware.use OmniAuth::Builder do
  	provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  	provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  	provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :scope => 'read_stream'
  	provider :foursquare, ENV['FOURSQUARE_KEY'], ENV['FOURSQUARE_SECRET']
  	#provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']
  	provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

	Twitter.configure do |config|
		config.consumer_key = ENV['TWITTER_KEY']
		config.consumer_secret = ENV['TWITTER_SECRET']
		config.oauth_token = ENV['TWITTER_TOKEN']
		config.oauth_token_secret = ENV['TWITTER_TOKEN_SECRET']
	end

	LinkedIn.configure do |config|
  		config.token = ENV['LINKEDIN_KEY']
  		config.secret = ENV['LINKEDIN_SECRET']
	end
end