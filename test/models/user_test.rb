require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:charlie)
  end

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without email" do
    @user.email = nil
    assert @user.invalid?
    assert_not_nil @user.errors[:email]
  end

  test "should have many tasks" do
    assert_respond_to @user, :tasks
  end
end
