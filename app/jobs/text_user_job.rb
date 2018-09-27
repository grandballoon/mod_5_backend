class TextUserJob < ApplicationJob
  queue_as :default

  def perform(text)
    client = TwilioTextMessenger.new(text)
    client.call
  end
end
