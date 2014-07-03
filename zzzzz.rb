require 'twitter'

class Terminaltwitter
	#authentication
	def o_auth
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
		#my_keys
		$ckey='gTfHpoDtJOg61HvT8OA0N8q28'
		$csecret='a23gfGTukB24pXhjFoo5dHjYHjDfXQaDeN1cmn1dJPyeVvgg4A'
		$atoken='1266814304-ZPf6Hti2lyi0JErbKZF0x196n894AamPejy7JEP'
		$asecret='e9K2RQtbZKSxNvKoDugslInRmM4kdmatZUJV7x4uvuKH1'
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
		print("Enter the name to unfollow: ")
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
			#Twitter::unfollow(arr)
		end
		#puts(client.friends.count)
		#puts(client.followers.count)		
	end
end



tweeter = Terminaltwitter.new
tweeter.o_auth
tweeter.revenge