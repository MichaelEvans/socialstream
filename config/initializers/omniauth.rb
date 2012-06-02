Rails.application.config.middleware.use OmniAuth::Builder do
  	provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  	provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  	provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :scope => 'read_stream'
  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

	Twitter.configure do |config|
		config.consumer_key = ENV['TWITTER_KEY']
		config.consumer_secret = ENV['TWITTER_SECRET']
		config.oauth_token = ENV['TWITTER_TOKEN']
		config.oauth_token_secret = ENV['TWITTER_TOKEN_SECRET']
	end
end