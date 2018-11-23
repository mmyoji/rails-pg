ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require "sidekiq/testing"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  private

  def sign_in(user, password = "password")
    post sessions_url, params: { user: { email: user.email, password: password } }
  end
end
