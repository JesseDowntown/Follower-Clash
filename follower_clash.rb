require 'rubygems'
require 'bundler/setup'

require_relative 'lib/user_comparer'

require_relative 'lib/user_comparer'

user1 = UserComparer::User.new('jkasnicki')
user2 = UserComparer::User.new('jessedowntown')
compareType = 'friends'
puts "#{user1.username}'s #{compareType} count: #{user1.send(compareType)}"
puts "#{user2.username}'s #{compareType} count: #{user2.send(compareType)}"
comparer = UserComparer::Comparer.new(user1, user2)

user_with_most_followers = comparer.compare(compareType)

puts "And the user with the most followers is: #{user_with_most_followers}"