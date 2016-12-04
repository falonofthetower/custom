class ErrorProxy
  attr_reader :messages

  def initialize(messages)
    @messages = messages
  end

  def messages?
    @messages.any?
  end
end
