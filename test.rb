require 'twitter'

client = Twitter::REST::Client.new do |config|
	config.consumer_key = 'gTfHpoDtJOg61HvT8OA0N8q28'
	config.consumer_secret = 'a23gfGTukB24pXhjFoo5dHjYHjDfXQaDeN1cmn1dJPyeVvgg4A'
	config.access_token = '1266814304-ZPf6Hti2lyi0JErbKZF0x196n894AamPejy7JEP'
	config.access_token_secret = 'e9K2RQtbZKSxNvKoDugslInRmM4kdmatZUJV7x4uvuKH1'
end
base   = Twitter::Base.new(client)
guilty = client.friends.to_a - client.followers.to_a
puts(guilty.first.name)
client.unfollow(guilty.first.name)
puts("Unfollowed")

#sleep(3)

#guilty.each do |num|
#  puts "#{guilty.first.name}"
#end

puts(client.friends.count)
puts(client.followers.count)

