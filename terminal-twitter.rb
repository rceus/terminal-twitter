require 'twitter'

class Terminaltwitter

	def oauth
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

	





end