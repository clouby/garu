require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @user = users(:simon)
  end

  test "valid task" do
    task = Task.new(name: "First Task", description: "This is a description", content: "<h1>Content</h1>", user: @user)
    assert task.valid?
  end

  test "invalid without name" do
    task = Task.new(description: "This is a description", content: "<h1>Content</h1>", user: @user)
    assert_not task.valid?
    assert_not_nil task.errors[:name]
  end

  test "invalid without description" do
    task = Task.new(name: "First Task", content: "<h1>Content</h1>", user: @user)
    assert_not task.valid?
    assert_not_nil task.errors[:description]
  end

  test "invalid without content" do
    task = Task.new(name: "First Task", description: "This is a description", user: @user)
    assert_not task.valid?
    assert_not_nil task.errors[:content]
  end

  test "invalid without user" do
    task = Task.new(name: "First Task", description: "This is a description", content: "<h1>Content</h1>")
    assert_not task.valid?
    assert_not_nil task.errors[:user]
  end

  test "should belong to a user" do
    task = Task.new
    assert_respond_to task, :user
  end

  test "should have statuses" do
    assert_equal %w[todo progress completed], Task.statuses.keys
  end

  test "should sort by name" do
    user = users(:simon)
    Task.create(name: "B Task", description: "desc", content: "content", user: user)
    Task.create(name: "A Task", description: "desc", content: "content", user: user)
    assert_equal "A Task", Task.sort_by_name.first.name
  end
end
