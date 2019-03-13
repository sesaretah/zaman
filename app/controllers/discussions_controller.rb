class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:edit, :update, :destroy, :show]
  before_action :extract_task, only: [:destroy]

  def create
    @discussion = Discussion.create(content: params[:content], user_id: current_user.id, task_id: params[:task_id])
    @task = @discussion.task
  end

  def destroy
    @task = @discussion.task
    @discussion.destroy
  end

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def extract_task
    @task = @discussion.task
  end
end
