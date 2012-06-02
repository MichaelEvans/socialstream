class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :authentications

  def apply_omniauth(omniauth)
    authentications.build(hash_from_omniauth(omniauth))
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def twitter
    unless @twitter_user
      provider = self.authentications.find_by_provider('twitter')
      @twitter_user = Twitter::Client.new(:oauth_token => provider.token, :oauth_token_secret => provider.secret) rescue nil
    end
    @twitter_user
  end

  def github
    unless @github_user
      provider = self.authentications.find_by_provider('github')
      @github_user = Github.new(:login => provider.uid, :oauth_token => provider.token) rescue nil
    end
    @github_user
  end

  def facebook
    unless @facebook_user
      provider = self.authentications.find_by_provider('facebook')
      #@facebook_user = FbGraph::User.new("me", :access_token => provider.token) rescue nil
      @facebook_user = Koala::Facebook::API.new(provider.token) rescue nil
    end
    @facebook_user
  end

  def linkedin
    #client = LinkedIn::Client.new
    #client.authorize_from_access("access_token", "access_token_secret")
  end
protected
  def hash_from_omniauth(omniauth)
    {
      :provider => omniauth['provider'], 
      :uid => omniauth['uid'], 
      :token => (omniauth['credentials']['token'] rescue nil),
      :secret => (omniauth['credentials']['secret'] rescue nil)
    }
  end
end