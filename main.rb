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
		
		#default keys
		#Or add default keys here! 
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
		$tweeter.options_choice
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
		options
	end
	#Follow a person
	def follow_name
		client = Twitter::REST::Client.new do |config|
			config.consumer_key = $ckey
			config.consumer_secret = $csecret
			config.access_token = $atoken
			config.access_token_secret = $asecret
		end
		print("Enter username to follow: ")
		to_follow = gets()
		to_follow = to_follow.chomp
		client.follow(to_follow)
		puts(to_follow+" followed.")
		options	
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
		puts(user_unfollow + " unfollowed.")
		options
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
			uname = arr.name
			client.unfollow(arr)
			puts(uname + ' has been unfollowed.')
		end
		options
	end
	#TimelineTweets
	def timeline_tweets
		client = Twitter::REST::Client.new do |config|
			config.consumer_key = $ckey
			config.consumer_secret = $csecret
			config.access_token = $atoken
			config.access_token_secret = $asecret
		end
		timelineTweets = client.home_timeline
		timelineTweets.each do |arr|
			puts(arr.text)
			puts()
			sleep(3)
		end
		puts()
		puts()
		options
	end

	def end_tt
		puts()
		puts('Thanks for using Terminal Twitter')
	end

	def options_choice
		if $choice=='1'
			$tweeter.tweetself
		elsif $choice=='2'
			$tweeter.follow_name
		elsif $choice=='3'
			$tweeter.unfollow_name
		elsif $choice=='4'	
			$tweeter.timeline_tweets
		elsif $choice=='5'
			$tweeter.revenge
		else
			puts('Wrong Choice. Aborted, start again.')
		end
	end
end



$tweeter = Terminaltwitter.new
$tweeter.o_auth
$tweeter.options