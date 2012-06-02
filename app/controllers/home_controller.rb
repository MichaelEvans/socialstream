class HomeController < ApplicationController

	def index
		mash = current_user.github.users.get
		@github_events = current_user.github.events.received(mash.login)
		@tweet_events = current_user.twitter.home_timeline
		@events = []
		@github_events.each do |event|
			event.feed = "github"
			@events.push(event)
		end
		@tweet_events.each do |event|
			mash = Hashie::Mash.new(JSON.parse(event.to_json))
			mash.feed = "twitter"
			@events.push(mash)

		end

		@events = @events.sort! { |a,b| 
			Time.parse(b.created_at).to_i <=> Time.parse(a.created_at).to_i
		}
		#render :text => current_user.twitter.home_timeline
		#render :text => current_user.github.events.received("MichaelEvans")
		# client = Twitter::Client.new
		# @tweets = client.home_timeline
	end

end
