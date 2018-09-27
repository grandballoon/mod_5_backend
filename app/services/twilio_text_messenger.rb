class TwilioTextMessenger
  attr_reader :message

  def initialize(message, phone)
    @message = message
    @phone = phone

  end


  def call
      client = Twilio::REST::Client.new
      client.messages.create({
        from: ENV["phone_number"],
        to: @phone,
        body: "#{@message}"
      })
  end


end
