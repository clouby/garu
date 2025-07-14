require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should have many tasks" do
    user = User.new
    assert_respond_to user, :tasks
  end
end