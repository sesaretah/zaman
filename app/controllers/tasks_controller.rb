class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :extract_milestone, only: [:update, :create, :new, :list]
  before_action :extract_project, only: [:new]

  def new
  end

  def list
  end

  def edit
  end

  def create
    @task = Task.create(task_params)
    @project = @task.milestone.project
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @project = @task.project
    @task.destroy
  end

  def set_task
    @task = task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :milestone_id)
  end

  def extract_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
  def extract_project
    @project = Project.find(params[:project_id])
  end
end
