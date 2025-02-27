require 'rails_helper'

RSpec.describe "Projects", type: :request do
  it "retrieves a project" do
    project = Project.create("Test Project")
    get project_path(project.id)
    expect(response).to be_successful
  end

  it "updates project status" do
    project = Project.create("Test Project")
    patch update_status_project_path(project.id), params: { status: "Completed" }
    expect(Project.find(project.id).status).to eq("Completed")
  end
end
