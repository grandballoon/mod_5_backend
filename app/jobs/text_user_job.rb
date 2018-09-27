class TextUserJob < ApplicationJob
  queue_as :default

  def perform(text, user)
    puts "-----------------"
    puts "THE USER NUMBER IS"
    puts "#{user}"
    client = TwilioTextMessenger.new(text, user)
    client.call
  end
end
