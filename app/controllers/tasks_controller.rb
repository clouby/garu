class TasksController < ApplicationController
  include TasksHelper

  before_action :authenticate_user!
  before_action :set_task, only: %i[show edit update destroy toggle]

  def index
    @tasks = current_user.tasks.recent_created
    @games = rawg_games_recent_releases.body
  end

  def show; end

  def new
    @task = Task.new
    @games = []
  end

  def edit; end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    respond_to do |format|
      if @task.update(toggle_task_params)
        format.turbo_stream
        format.html { redirect_to tasks_url, notice: "Task was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task was successfully destroyed."
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, :content, :status, :rawg_game_id)
    end

    def toggle_task_params
      params.permit(:status)
    end
end
