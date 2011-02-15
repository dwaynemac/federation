ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'blueprints'

class ActiveSupport::TestCase

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Here we mock login on Controller tests
class ActionController::TestCase
  include Devise::TestHelpers

  # before each test sign in as a user.
  setup do
    @user = User.make
    @federation = @user.federation
    sign_in :user, @user
  end
end

