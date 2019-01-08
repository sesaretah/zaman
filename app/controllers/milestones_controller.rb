class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:edit, :update, :destroy]
  before_action :extract_project, only: [:update, :create]

  def edit
  end

  def create
    @milestone = Milestone.create(milestone_params)
  end

  def update
    @milestone.update(milestone_params)
  end

  def destroy
    @milestone.destroy
  end

  def set_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:title, :details, :project_id)
  end

  def extract_project
    @project = Project.find(params[:project_id])
  end
end
