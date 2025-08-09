# frozen_string_literal: true

module System
  module Devise
    include Warden::Test::Helpers

    def sign_in(user)
      login_as(user, scope: :user)
    end

    def sign_out(user)
      logout(user)
    end
  end
end

RSpec.configure do |config|
  config.include System::Devise, type: :system
  config.before(:each, type: :system) do
    driven_by(:rack_test)
  end
  config.before(:each, type: :system, js: true) do
    driven_by(:selenium_chrome_headless)
  end
end
