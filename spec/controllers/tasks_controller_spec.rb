require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  include Devise::Test::IntegrationHelpers
  fixtures :users, :tasks

  let(:user) { users(:simon) }
  let(:task) { tasks(:one) }

  before do
    sign_in user
  end

  describe "GET /tasks" do
    it "returns http success" do
      get tasks_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tasks/new" do
    it "returns http success" do
      get new_task_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /tasks" do
    context "with valid parameters" do
      it "creates a new task" do
        expect {
          post tasks_path, params: {
            task: {
              name: "New Task",
              description: "A new task description",
              content: "<div>A new task content</div>",
              status: "todo"
            }
          }
        }.to change(Task, :count).by(1)
        expect(response).to redirect_to(task_url(Task.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new task" do
        expect {
          post tasks_path, params: {
            task: {
              name: "",
              description: "",
              content: "",
              status: "todo"
            }
          }
        }.to_not change(Task, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /tasks/:id" do
    it "returns http success" do
      get task_path(task)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tasks/:id/edit" do
    it "returns http success" do
      get edit_task_path(task)
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /tasks/:id" do
    context "with valid parameters" do
      it "updates the task" do
        patch task_path(task), params: {
          task: {
            name: "Updated Task Name"
          }
        }
        expect(response).to redirect_to(task_url(task))
        task.reload
        expect(task.name).to eq("Updated Task Name")
      end
    end

    context "with turbo stream" do
      it "updates the task and returns a turbo stream" do
        patch task_path(task), params: {
          task: {
            status: "completed"
          }
        }, as: :turbo_stream
        expect(response).to have_http_status(:success)
        expect(response.media_type).to eq Mime[:turbo_stream]
        expect(response.body).to include("<turbo-stream action=\"replace\" target=\"#{dom_id(task)}\">")
      end
    end

    context "with invalid parameters" do
      it "does not update the task" do
        patch task_path(task), params: {
          task: {
            name: ""
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /tasks/:id" do
    it "destroys the task" do
      # Need to create a new task to be deleted, because the fixture task is used in other tests
      new_task = Task.create(name: "Task to be deleted", description: "desc", content: "content", user: user)
      expect {
        delete task_path(new_task)
      }.to change(Task, :count).by(-1)
      expect(response).to redirect_to(tasks_url)
    end
  end

  describe "Authentication" do
    it "redirects to sign in if not authenticated" do
      sign_out user
      get tasks_path
      expect(response).to redirect_to(new_user_session_url)
    end
  end
end
