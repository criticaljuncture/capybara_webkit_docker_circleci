# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

unless RbConfig::CONFIG['host_os'] =~ /darwin|mac os/
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit { headless.stop }
end

Capybara.run_server = true
Capybara.javascript_driver = :webkit
Capybara.server_port = 12345

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true

  c.before(:each) do
    host = 'test.host'
    Capybara.current_session.driver.reset!
    Capybara.app_host = "http://" + host + ":#{Capybara.server_port}"
  end
end
