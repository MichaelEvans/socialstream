Rails.application.config.middleware.use OmniAuth::Builder do
  	provider :twitter, 'qNnmeVzKOwkHZO1gnUF1OA', 'ElfdUjeqo0dlXhVSF8IXBo2kiYQm3tptG5YXYMQHE'
  	provider :github, '2c84dfbc49cbea298dbf', '37408194d72ab2f0af1139ea3fee039d92988abf'
  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

	Twitter.configure do |config|
		config.consumer_key = 'qNnmeVzKOwkHZO1gnUF1OA'
		config.consumer_secret = 'ElfdUjeqo0dlXhVSF8IXBo2kiYQm3tptG5YXYMQHE'
		config.oauth_token = '388421834-wnTSn9AMsErcM1mniOfNEzmNZPRxBx2Yje1nKxTw'
		config.oauth_token_secret = 'X0b3RWyhqxLqwIIPJ4gmSLiyiyj1yRAbQikF5PJZ8'
	end
end