ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'simplecov'
require 'factory_bot'

SimpleCov.start

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Rails.application.routes.url_helpers, type: :request
  config.before(:suite) do
    DatabaseCleaner.start
    DatabaseCleaner.clean_with(:truncation)
  end
  config.after(:suite) do
    DatabaseCleaner.clean
  end
end