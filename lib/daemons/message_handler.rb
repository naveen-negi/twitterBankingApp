require 'pry'
require 'rest-client'

ENV['ACCOUNT_SERVICE_URL'] = 'http://localhost:3000/customers/'

class MessageHandler
  HELP_MESSAGE =
  %q(You can use following tags to perform banking via Twitter
     1. #help to see the list of available actions
     2. #bal to check your account balance)

  ACCOUNT_SERVICE_URL = ENV['ACCOUNT_SERVICE_URL']

  def initialize configuration
    @message_client = Twitter::REST::Client.new(configuration)
  end

  def handle message
    begin
      send(message.hashtags.first.text.to_sym, message)
    rescue
      help message
    end
  end

  def help message
    @message_client.create_direct_message(message.sender.id, "#{HELP_MESSAGE}\nsent at: #{Time.now}")
  end

  def bal message
    sender_id = message.sender.id
    accounts = JSON.parse(RestClient.get "#{ACCOUNT_SERVICE_URL}/#{sender_id}/accounts.json")
    accounts.each do |account|
      acct_number = account['number']
      @message_client.create_direct_message(sender_id,
      "Your a/c: XX#{acct_number[acct_number.size-4..-1]} has Avl Bal: AUD #{account['balance']}.\nSent at: #{Time.now}")
    end
  end
end
