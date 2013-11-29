require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
	class User

		attr_reader :username
		def initialize (username)
			@username = username
			@client = Twitter::REST::Client.new do |config|
				config.consumer_key        = ENV['CONSUMER_KEY']
				config.consumer_secret     = ENV['CONSUMER_SECRET']
				config.access_token        = ENV['OAUTH_TOKEN']
				config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
			end
		end

		def followers
			 @client.user(@username).followers_count
		end

		def friends
			 @client.user(@username).friends_count
		end

		def tweets
			@client.user(@username).statuses_count
		end
	end

	class Comparer
		def initialize (user1, user2)
			@user1 = user1
			@user2 = user2
		end

		def compare(compareType)
			if (@user1.send(compareType) > @user2.send(compareType))
				return @user1.username
			elsif (@user1.send(compareType) < @user2.send(compareType))
				return @user2.username
			else
				return "equal number of #{compareType}"
			end
		end
	end
end