require 'rubygems'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "wr8Tr2f40fdol6DprD9OtHtVj"
  config.consumer_secret     = "Y6zQA3OxGNf6Zkrs0WM7vLBJSWePdTdOfSkA4E40phvOOJmGi0"
  config.access_token        = "1266814304-0vkn6Rx1oIrO4NLaN1lojFuVI0NSynaYroW95iB"
  config.access_token_secret = "dTGckvpyrwM7H1NhVVrUUEsYtSCU58xY4cEwAVsuxyFIA"
end

client.update("Ruby Gem Test!")


#base = Twitter::Base.new(client)
#guilty = base.friends_ids - base.followers_ids
#puts "#{guilty.size} people you follow don't follow you back:"

#guilty.each do |user_id|
#	user = base.user(user_id)
#	puts "#{user.name} follows #{user.friend_count}" +
#	"and has #{user.followers_count} followers."
#end




#topics = ["coffee","tea"]
#client.filter(:track => topics.join(",")) do |object|
#	puts object.text if object.is_a?(Twitter::Tweet)
#end


puts("config complete")