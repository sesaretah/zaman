class ParticipationsController < ApplicationController
  def change_status
    @status = Status.find(params[:status_id])
    @participation = Participation.find(params[:id])
    @participation.status_id = @status.id
    @participation.save
    @project = @participation.project
  end
end
