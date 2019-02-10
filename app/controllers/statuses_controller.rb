class StatusesController < ApplicationController
  before_action :set_status, only: [:edit, :update, :destroy]
  before_action :clean_checkboxes, only: [:update]

  def edit
  end

  def create
    @status = Status.create(status_params)
  end

  def update
    @status.update(status_params)
  end

  def destroy
    @status.destroy
  end

  def set_status
    @status = Status.find(params[:id])
  end

  def status_params
    params.require(:status).permit(:title, :scope_type, :next_id, :previous_id, :start_point, :end_point)
  end

  def clean_checkboxes
    @status.start_point = false
    @status.end_point = false
  end
end
