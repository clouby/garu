require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  setup do
    @user = users(:simon)
    sign_in @user
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: "Your Tasks"
  end

  test "creating a Task" do
    visit tasks_url
    click_on "New Task"

    fill_in "Name", with: "New Task"
    fill_in "Description", with: "New Description"
    find(:css, "trix-editor").set("New Content")
    click_on "Create Task"

    assert_text "Task was successfully created"
  end

  test "updating a Task" do
    visit task_url(@task)
    click_on "Edit"

    fill_in "Name", with: "Updated Task"
    click_on "Update Task"

    assert_selector "h2", text: "Updated Task"
  end

  # FIXME: Please take a look what's causing the error on this tast case.
  test "destroying a Task" do
    visit task_url(@task)

    click_on "Delete"

    within("#modal_confirm_delete") do
      click_on "Delete Task"
    end

    assert_text "Task was successfully destroyed"
  end
end
