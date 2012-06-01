Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'qNnmeVzKOwkHZO1gnUF1OA', 'ElfdUjeqo0dlXhVSF8IXBo2kiYQm3tptG5YXYMQHE'
  provider :github, '2c84dfbc49cbea298dbf', '37408194d72ab2f0af1139ea3fee039d92988abf'
  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end