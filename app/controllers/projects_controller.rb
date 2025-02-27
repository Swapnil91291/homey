class ProjectsController < ApplicationController
  def show
    # Created new record for new id
    @project = Project.find(params[:id]) || Project.create("Project#{params[:id]}")
  end

  def update_status
    @project = Project.find(params[:id])
    @project.update_status(params[:status])
    redirect_to project_path(@project.id)
  end
end
