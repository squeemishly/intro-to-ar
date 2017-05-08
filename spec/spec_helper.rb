ENV['RACK_ENV'] = 'test'

require "rspec"
require 'database_cleaner'
require 'capybara/dsl'

require File.expand_path('../../config/environment.rb', __FILE__)

DatabaseCleaner.strategy = :truncation
Capybara.app = HorseApp

RSpec.configure do |c|
  c.include Capybara::DSL
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
