require 'twitter'

class Terminaltwitter
	#Tweet Function
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
	#Follow a person
	def follow_name
		print("Enter username to follow: ")
		to_follow = gets()
		to_follow = to_follow.chomp
		client.follow(to_follow)	
	end
	#Revenge: Unfollow people who did not follow you back
	def revenge

	end
end


print('Welcome to TerminalTwitter!')
gets()
puts("You will need to get keys and secrets to access this application. Available on https://dev.twitter.com/")
gets()
print("Enter Consumer Key (Available on twitter developer website): ")
$ckey = gets().chomp
print("Enter Consumer Secret: ")
$csecret = gets().chomp
print("Enter Access Token: ")
$atoken = gets().chomp
print("Enter Access Token Secret: ")
$asecret = gets().chomp

user = Terminaltwitter.new
user.tweetself