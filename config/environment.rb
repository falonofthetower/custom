# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.configure do
  Rails.application.routes.default_url_options[:host] = ENV["HOST"]
end
