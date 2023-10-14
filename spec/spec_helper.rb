require File.expand_path('../config/environment', __dir__)
require 'simplecov'
require 'factory_bot'

SimpleCov.start

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end