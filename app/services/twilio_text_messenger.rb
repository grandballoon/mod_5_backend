class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    client = Twilio::REST::Client.new
    client.messages.create({
      from: ENV["phone_number"],
      to: +19144713513,
      body: @message
    })
  end
end
