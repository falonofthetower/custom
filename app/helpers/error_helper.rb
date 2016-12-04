module ErrorHelper
  def messages
    self.errors.full_messages
  end

  def messages?
    self.errors.any?
  end
end
