require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  let(:user) { users(:simon) }
  let(:task) { tasks(:one) }

  before do
    sign_in user
  end

  it "visits the index" do
    visit tasks_path
    expect(page).to have_selector("h1", text: "Your Tasks")
  end

  it "creates a Task", js: true do
    visit tasks_path
    click_on "New Task"

    fill_in "Name", with: "New Task"
    fill_in "Description", with: "New Description"
    find('trix-editor').click.set('New content')
    click_on "Create Task"

    expect(page).to have_text("Task was successfully created")
  end

  it "updates a Task" do
    visit task_path(task)
    click_on "Edit"

    fill_in "Name", with: "Updated Task"
    click_on "Update Task"

    expect(page).to have_selector("h2", text: "Updated Task")
  end

  it "destroys a Task" do
    visit task_path(task)

    click_on "Delete"

    within("#modal_confirm_delete") do
      click_on "Delete Task"
    end

    expect(page).to have_text("Task was successfully destroyed")
  end
end
