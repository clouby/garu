require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "valid task" do
    task = Task.new(name: "First Task", description: "This is a description", content: "<h1>Content</h1>", user: users(:simon))
    assert task.valid?
  end
end
