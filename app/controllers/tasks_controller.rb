class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :extract_milestone, only: [:update, :create, :new, :edit]
  before_action :extract_project, only: [:new, :list]

  def new
  end

  def list
  end

  def edit
    @project = @milestone.project
  end

  def create
#    @time = Time.at(params[:unix_time].to_i / 1000)
#    @task = 
    @task = Task.create(task_params)
    @project = @task.milestone.project
    manage_assignments
    manage_events
  end

  def update
    @task.update(task_params)
    @project = @task.milestone.project
    manage_assignments
    manage_events
  end

  def manage_assignments
    params.each do |param|
      if param[0].include?('assignee')
        @assignments = Assignment.where(task_id: @task.id, user_id: param[1])
        for assignment in @assignments
          assignment.destroy
        end
        @assignment = Assignment.create(task_id: @task.id, user_id: param[1])
      end
    end
  end

  def manage_events
    @time = Time.at(params[:unix_time].to_i / 1000)
    @speardings = Spearding.where(speardable_type: 'Task', speardable_id: @task.id)
    for spearding in @speardings
      @previous_event = spearding.event
      @previous_event.destroy
    end
    for assignment in @task.assignments
      @event = Event.create(starts_at: "#{params[:starts_at_hour]}:#{params[:starts_at_minutes]}", ends_at: "#{params[:starts_at_hour]}:#{params[:starts_at_minutes]}", event_date: @time.to_date, user_id: assignment.user_id,content: @task.title)
      manage_speardables(@event, 'Task', @task.id)
    end
  end

  def destroy
    @project = @task.milestone.project
    @task.destroy
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :milestone_id, :deadline_time, :deadline)
  end

  def extract_milestone
    @milestone = Milestone.find(params[:milestone_id])
  end
  def extract_project
    @project = Project.find(params[:project_id])
  end
end
