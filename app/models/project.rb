require 'json'

class Project
  FILE_PATH = Rails.root.join('storage', 'project_data.json')

  attr_accessor :id, :name, :status, :comments, :status_changes

  def initialize(id, name, status="Pending")
    @id = id
    @name = name
    @status = status
    @comments = []
    @status_changes = []
  end

  def self.all
    load_projects
  end

  def self.find(id)
    load_projects[:"#{id}"]
  end

  def self.create(name)
    projects = load_projects
    id = (projects.keys.max.to_s.to_i || 0) + 1
    project = Project.new(id, name)
    projects[id] = project
    save_projects(projects)
    project
  end

  def update_status(new_status)
    @status_changes << { previous_status: @status, new_status: new_status, created_at: Time.now }
    @status = new_status
    save
  end

  def add_comment(content)
    @comments << { content: content, created_at: Time.now }
    save
  end

  def save
    projects = self.class.load_projects
    projects[@id] = self
    self.class.save_projects(projects)
  end

  def self.load_projects
    return {} unless File.exist?(FILE_PATH)
    
    JSON.parse(File.read(FILE_PATH), symbolize_names: true).transform_values do |data|
      project = Project.new(data[:id], data[:name], data[:status])
      project.comments = data[:comments] || []
      project.status_changes = data[:status_changes] || []
      project
    end
  end

  def self.save_projects(projects)
    FileUtils.mkdir_p(File.dirname(FILE_PATH))
    File.write(FILE_PATH, JSON.dump(projects.transform_values(&:to_h)))
  end

  def to_h
    {
      id: @id,
      name: @name,
      status: @status,
      comments: @comments,
      status_changes: @status_changes
    }
  end
end
