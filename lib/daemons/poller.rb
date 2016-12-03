require_relative './message_handler'
require 'tweetstream'

ENV['CONSUMER_KEY'] = 'sdIndIpBKDTqdNqoY5mwislyu'
ENV['CONSUMER_SECRET'] = 'K1pJDBVIg4FgL0aGZ1Y2b9veXVzyEEQwdPPkCKoNFP6SQCdr4s'
ENV['CONSUMER_TOKEN'] = '3419564554-GQTHd3fhzvxCmhryObm8CoUQMmzarpzfcxmrXGg'
ENV['CONSUMER_TOKEN_SECRET'] = 'k6mC2grV3Kgx016Mp672eszK9okQfik4IRU27Nk92zXe4'
ENV['ACCESS_TOKEN'] = '3419564554-GQTHd3fhzvxCmhryObm8CoUQMmzarpzfcxmrXGg'
ENV['ACCESS_TOKEN_SECRET'] = 'k6mC2grV3Kgx016Mp672eszK9okQfik4IRU27Nk92zXe4'

configuration = {
  :consumer_key        => ENV['CONSUMER_KEY'],
  :consumer_secret     => ENV['CONSUMER_SECRET'],
  :oauth_token         => ENV['CONSUMER_TOKEN'],
  :oauth_token_secret  => ENV['CONSUMER_TOKEN_SECRET'],
  :access_token        => ENV['ACCESS_TOKEN'],
  :access_token_secret => ENV['ACCESS_TOKEN_SECRET'],
  :auth_method         => :oauth
}

TweetStream.configure do |config|
  configuration.each do |key, value|
    config.send("#{key}=".to_sym, value) if config.respond_to? key
  end
end

client = TweetStream::Client.new
handler = MessageHandler.new configuration

client.on_error do |error|
  puts error
end

client.on_direct_message do |direct_message|
  handler.handle direct_message
end

client.userstream

puts "And we are done!"
