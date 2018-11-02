class TextUserJob < ApplicationJob
  queue_as :default

  def perform(text, user)
    client = TwilioTextMessenger.new(text, user)
    client.call
  end
end
