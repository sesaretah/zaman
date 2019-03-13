class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :milestones, :tasks, :participants, :participate, :unparticipate, :gantt]

  def participate
    if @project.p_type == 'Public'
      @status = Status.where(scope_type: 'Participation', end_point: true).first
    else
      @status = Status.where(scope_type: 'Participation', start_point: true).first
    end
    @participation = Participation.create(user_id: current_user.id, project_id: @project.id, status_id: @status.id)
  end

  def unparticipate
    @participation = Participation.where(user_id: current_user.id, project_id: @project.id).first
    @participation.destroy
  end


  def participants
    @participations = Participation.where(project_id: @project.id)
  end

  def gantt
    if !params[:start].blank?
      @start = Time.at(params[:start].to_i / 1000).to_date
    else
      @start = 1.month.ago.to_date
    end
    if !params[:end].blank?
      @end = Time.at(params[:end].to_i / 1000).to_date
    else
      @end = Date.today
    end
    @tasks = Task.where('created_at >= ? AND deadline <= ?', @start, @end)
    @days = []
    for day in @start..@end
      @jalali = JalaliDate.to_jalali(day)
      @days << "#{@jalali.year}/#{@jalali.month}/#{@jalali.day}"
    end
  end

  def tasks

  end

  def milestones

  end
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @upload_ids = Upload.where(uploadable_type: 'Project', uploadable_id: @project.id).pluck(:id)
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        manage_uploads(@project)
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.update(project_params)
        manage_uploads(@project)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :details, :user_id, :p_type)
    end
end
