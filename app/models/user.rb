require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class User < ActiveRecord::Base
  has_many :selections
  has_many :restaurants, through: :selections

  def sendtext(message_body)
    puts "Sending a text !"
    puts "to: #{self.name}!"
    puts "at phone: #{self.phone}"
    puts "message is: #{message_body}"

	# put your own credentials here
	account_sid = 'ACdd70c948b4f56f7819254eccf5536b8f'
	auth_token = 'a7b756e76b2e3cfb193deca5f10e9a82'

	# set up a client to talk to the Twilio REST API
	@client = Twilio::REST::Client.new account_sid, auth_token

	@client.account.messages.create({
	        :from => '+16502884742',
	        :to => '415-595-0175',     
	        :body => "#{message_body}",
	})

  end
end
