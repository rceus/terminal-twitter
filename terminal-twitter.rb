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
		$ckey='gTfHpoDtJOg61HvT8OA0N8q28'
		$csecret='a23gfGTukB24pXhjFoo5dHjYHjDfXQaDeN1cmn1dJPyeVvgg4A'
		$atoken='1266814304-ZPf6Hti2lyi0JErbKZF0x196n894AamPejy7JEP'
		$asecret='e9K2RQtbZKSxNvKoDugslInRmM4kdmatZUJV7x4uvuKH1'
	end

	





end