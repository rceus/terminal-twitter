require 'twitter'

class Terminaltwitter
	#authentication
	def o_auth
		puts('Welcome to TerminalTwitter!')
		say `Welcome to Terminal Twitter!`
		gets()
		puts("You will need to get keys and secrets to access this application. Available on https://dev.twitter.com/")
		say `You will need to get keys and secrets to access this application. Available on https://dev.twitter.com/`
		gets()
		print("Enter Consumer Key (Available on twitter developer website): ")
		say `Enter your Consumer Key`
		$ckey = gets().chomp
		print("Enter Consumer Secret: ")
		say `Enter your Consumer Secret`
		$csecret = gets().chomp
		print("Enter Access Token: ")
		say `Enter Access Token`
		$atoken = gets().chomp
		print("Enter Access Token Secret: ")
		say `Enter Access Token Secret`
		$asecret = gets().chomp
		say `Initiating`
		#default keys
		#Or add default keys here! 
	end
	#display
	def options
		puts()
		puts('Select the operation: ')
		say `Select from the following options.`
		puts('1 - Tweet!')
		puts('2 - Follow a person')
		puts('3 - Unfollow a person')
		puts('4 - Timeline Feed')
		puts('5 - See who did not follow you back')
		say `Press 1 to Tweet, Press 2 to Follow a person, Press 3 to Unfollow a person, Press 4 to view your timeline and press 5 to unfollow those who did not follow you back`
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
		say `You have chosen the first option. Enter the tweet. Limit to 140 characters.` 
		tweet=gets
		tweet=tweet.chomp
		#add length check here
		client.update(tweet)
		puts("Tweeted!")
		say `Tweeted!`
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
		say `You have chosen option 2. Enter the username of the person you want to follow.`
		to_follow = gets()
		to_follow = to_follow.chomp
		client.follow(to_follow)
		test = to_follow + " followed."
		puts(test)
		#check here.
		say `#{test}`
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
		say `You have chosen option 3. Enter the username to unfollow.` 
		user_unfollow=gets().chomp
		client.unfollow(user_unfollow)
		test = user_unfollow + " unfollowed"
		puts(test)
		say `#{test}`
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
		say `You have chose option 6. Now we are going to unfollow all those users who did not follow you back.`
		base   = Twitter::Base.new(client)
		badpeople = client.friends.to_a - client.followers.to_a
		test = badpeople.count.to_s + " people you are following do not follow you back!"
		puts(test)
		say `#{test}`
		count=badpeople.count
		arr=0..count
		badpeople.each do |arr|
			puts(arr.name)
			uname = arr.name
			client.unfollow(arr)
			test2=uname + ' has been unfollowed.'
			puts(test2)
			say `#{test}`
		end
		options
	end
	#TimelineTweets
	def timeline_tweets
		say `You have chosen option 5. Your timeline feed will be up in a minute.` 
		client = Twitter::REST::Client.new do |config|
			config.consumer_key = $ckey
			config.consumer_secret = $csecret
			config.access_token = $atoken
			config.access_token_secret = $asecret
		end
		timelineTweets = client.home_timeline
		timelineTweets.each do |arr|
			puts(arr.text)
			#check here
			#mini method
			say `#{arr.text}`
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
		say `Thanks for using Terminal Twitter`
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
			say `Wrong Choice. Aborted, start again.`
		end
	end
end
$tweeter = Terminaltwitter.new
$tweeter.o_auth
$tweeter.options