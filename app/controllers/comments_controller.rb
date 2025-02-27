class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @project.add_comment(params[:content])
    redirect_to project_path(@project.id)
  end
end
