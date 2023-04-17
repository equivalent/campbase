class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def update
    @project.assign_attributes(project_params)
    status_changed = @project.status_changed?

    respond_to do |format|
      if @project.save
        Entry.create!(entryable: Event.new(occasion: "project_#{@project.status}"), project: @project) if status_changed
        # NotifyProjectStatusChangeJob.perform_later(project_id: @project.id, status_change: status_change) if status_changes
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.fetch(:project).permit(:status)
  end
end
