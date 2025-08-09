require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { users(:simon) }

  it "is valid with valid attributes" do
    task = Task.new(name: "First Task", description: "This is a description", content: "<h1>Content</h1>", user: user)
    expect(task).to be_valid
  end

  it "is not valid without a name" do
    task = Task.new(description: "This is a description", content: "<h1>Content</h1>", user: user)
    expect(task).to_not be_valid
    expect(task.errors[:name]).to_not be_nil
  end

  it "is not valid without a description" do
    task = Task.new(name: "First Task", content: "<h1>Content</h1>", user: user)
    expect(task).to_not be_valid
    expect(task.errors[:description]).to_not be_nil
  end

  it "is not valid without content" do
    task = Task.new(name: "First Task", description: "This is a description", user: user)
    expect(task).to_not be_valid
    expect(task.errors[:content]).to_not be_nil
  end

  it "is not valid without a user" do
    task = Task.new(name: "First Task", description: "This is a description", content: "<h1>Content</h1>")
    expect(task).to_not be_valid
    expect(task.errors[:user]).to_not be_nil
  end

  it "should belong to a user" do
    task = Task.new
    expect(task).to respond_to(:user)
  end

  it "should have statuses" do
    expect(Task.statuses.keys).to eq(%w[todo progress completed])
  end

  it "should sort by name" do
    Task.create(name: "B Task", description: "desc", content: "content", user: user)
    Task.create(name: "A Task", description: "desc", content: "content", user: user)
    expect(Task.sort_by_name.first.name).to eq("A Task")
  end

  it "should sort by recent created at" do
    Task.create(name: "B Task", description: "desc", content: "content", user: user)
    task_a = Task.create(name: "A Task", description: "desc", content: "content", user: user)
    expect(Task.recent_created.first).to eq(task_a)
  end
end
