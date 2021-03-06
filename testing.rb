require 'twitter'

class Terminaltwitter
	#authentication
	def o_auth
		puts('Welcome to TerminalTwitter!')
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
		#my_keys
	end
	#display
	def options
		puts()
		puts('Select the operation: ')
		puts('1 - Tweet!')
		puts('2 - Follow a person')
		puts('3 - Unfollow a person')
		puts('4 - Timeline Feed')
		puts('5 - See who did not follow you back')
		$choice=gets.chomp
	end
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
	#Unfollow a person
	def unfollow_name
		client = Twitter::REST::Client.new do |config|
			config.consumer_key = $ckey
			config.consumer_secret = $csecret
			config.access_token = $atoken
			config.access_token_secret = $asecret
		end
		print("Enter the username to unfollow: ")
		user_unfollow=gets().chomp
		client.unfollow(user_unfollow)
		puts(user_unfollow + " unfollowed")
	end
	#Revenge: Unfollow people who did not follow you back	
	def revenge
		client = Twitter::REST::Client.new do |config|
			config.consumer_key = $ckey
			config.consumer_secret = $csecret
			config.access_token = $atoken
			config.access_token_secret = $asecret
		end
		base   = Twitter::Base.new(client)
		badpeople = client.friends.to_a - client.followers.to_a
		
		puts(badpeople.count.to_s + " people you are following do not follow you back!")
		count=badpeople.count
		arr=0..count
		badpeople.each do |arr|
			puts(arr.name)
			client.unfollow(arr)
		end
	end
end



tweeter = Terminaltwitter.new
tweeter.o_auth
tweeter.options
tweeter.revenge