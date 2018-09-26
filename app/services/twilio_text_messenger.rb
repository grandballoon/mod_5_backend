class TwilioTextMessenger
  attr_reader :message

  def initialize(message)
    @message = message
    @time = Time.now.advance(seconds: 10)
    @reps = [@time.advance(seconds: 10), @time.advance(seconds:10)]
    @index = 0
  end

  def call
      client = Twilio::REST::Client.new
      client.messages.create({
        from: ENV["phone_number"],
        to: +19144713513,
        body: @message
      })
      @time = @resp[@index]
      @index += 1
      if @time = @reps[-1]
        self.destroy
      end

  end
    # handle_asynchronously :call, :run_at => Proc.new { @time }

end
