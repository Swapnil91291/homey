# README

# Homey Test
### Step 1: Running the Application
```sh
rails server
```
Then open `http://localhost:3000/projects/1` in your browser.

### Step 2: Running Tests
```sh
rspec
```

### Step 3: Default data with JSON File (`storage/project_data.json`)
```json
{
  "1": {
    "id": 1,
    "name": "Project1",
    "status": "Pending",
    "comments": [],
    "status_changes": []
  }
}
```
### Note:
```
1) I am using json file storage for project data.
2) Based on id have created new project with default name Project{id}.
