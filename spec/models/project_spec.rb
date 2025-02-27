require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { Project.create("Test Project") }

  it "creates a new project with a default status" do
    expect(project.status).to eq("Pending")
  end

  it "updates project status" do
    project.update_status("In Progress")
    expect(project.status).to eq("In Progress")
  end

  it "adds comments to a project" do
    project.add_comment("This is a test comment")
    expect(project.comments.last[:content]).to eq("This is a test comment")
  end
end
