require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:simon)
    @task = tasks(:one)
    sign_in @user
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: {
        task: {
          name: "New Task",
          description: "A new task description",
          content: "<div>A new task content</div>",
          status: "todo"
        }
      }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should not create task with invalid parameters" do
    assert_no_difference("Task.count") do
      post tasks_url, params: {
        task: {
          name: "",
          description: "",
          content: "",
          status: "todo"
        }
      }
    end

    assert_response :unprocessable_entity
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: {
      task: {
        name: "Updated Task Name",
        description: @task.description,
        content: @task.content
      }
    }
    assert_redirected_to task_url(@task)
    @task.reload
    assert_equal "Updated Task Name", @task.name
  end

  test "should update task with turbo stream" do
    patch task_url(@task), params: {
      task: {
        name: @task.name,
        description: @task.description,
        content: @task.content,
        status: "completed"
      }
    }, as: :turbo_stream

    assert_response :success
    assert_turbo_stream action: "replace", target: @task
  end

  test "should not update task with invalid parameters" do
    patch task_url(@task), params: {
      task: {
        name: ""
      }
    }
    assert_response :unprocessable_entity
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end

  test "should not access tasks if not signed in" do
    sign_out @user
    get tasks_url
    assert_redirected_to new_user_session_url
  end
end

