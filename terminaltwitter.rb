require 'twitter'

class Terminaltwitter

	def oauth
		print("Enter Consumer Key (Available on twitter developer website): ")
		$ckey = gets()
		$ckey = $key
		print("Enter Consumer Secret: ")
		$csecret = gets()
		$csecret = $secret
		print("Enter Access Token: ")
		$atoken = gets()
		$atoken = $atoken
		print("Enter Access Token Secret: ")
		$asecret = gets()
		$asecret = $asecret

		client = Twitter::REST::Client.new do |config|
			config.consumer_key = $ckey
			config.consumer_secret = $csecret
			config.access_token = $atoken
			config.access_token_secret = $asecret
		end
	end

	def tweetself
		client = Twitter::REST::Client.new do |config|
			config.consumer_key = $ckey
			config.consumer_secret = $csecret
			config.access_token = $atoken
			config.access_token_secret = $asecret
		end
		print("Enter Tweet: ")
		tweet=gets
		tweet=tweet.chomp
		client.update(tweet)
		puts("Tweeted!")
	end

	def follow_name
		print("Enter username to follow: ")
		to_follow = gets()
		to_follow = to_follow.chomp
		client.follow(to_follow)	
	end
end

user = Terminaltwitter.new
user.oauth
user.tweetself
#user.follow_name
