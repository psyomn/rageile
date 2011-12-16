require 'singleton' 

require_relative 'Project.rb'
require_relative 'Task.rb'
require_relative 'User.rb'

#author::Simon Symeonidis 
# This class holds the data which needs to be accessible from
# all the ui elements. We assume that only one instance is 
# needed in order to let the system work appropriately 
class Central 

  attr_reader :Users
  attr_reader :Projects
  attr_reader :Tasks

public
  include Singleton

  # default initializement here
  def initialize 
    @Projects = Array.new 
    @Users = Array.new
    @Tasks = Array.new 
  end 

public 

  # Return a user by id number
  def getUserByID(id) 
    ret = nil
    @Users.each do |user|
      ret = user if user.ID == id 
    end 

    return ret
  end 

  # Return a project by id number 
  def getProjectByID(id)
    ret = nil 
    @Projects.each do |project| 
      ret = project if project.ID == id 
    end 

    return ret 
  end 

  # Returns a task by id number
  def getTaskByID(id) 
    ret = nil 

    @Tasks.each do |task| 
      ret = task if task.ID == id
    end 
  end 

  # Create a new user
  def createUser(nickname) 
    usr = User.new(nickname)
    backend_addUser(usr) 
  end 

  # create a project with a description
  def createProject(description) 
    project = Project.new 
    project.Description = description 
    @Projects.push(project) 
  end 

  # create a task and store inside task 
  # repository
  def createTask(description) 
    task = Task.new
    task.Description = description
    @Tasks.push task
  end 

  # Add a user to a project
  def addUserToProject(userid,projectid)
    user = getUserByID(userid) 
    project = getProjectByID(projectid) 

    if user != nil and project != nil 
      project.addOwner(user)
    else 
      puts "Project or user not found. "
    end 
  end 

  # Add a task to a project
  def addTaskToProject(taskid,projectid)
    task = getTaskByID(taskid) 
    project = getProjectByID(projectid) 

    if task != nil and project != nil 
      project.addTask(task)
    else
      puts "Task or project has not been found."
    end 
  end 

  # Delete entity with specified id
  def deleteUser(id) 
    user_to_remove = getUserByID(id)

    if user_to_remove != nil 
      @Users.delete(user_to_remove)
    else
      puts "No such user."
    end 
  end

  # Delete entity with specified id
  def deleteProject(id) 
    project_to_remove = getProjectByID(id)

    if project_to_remove != nil 
      @Projects.delete(project_to_remove)
    else 
      puts "No such project. "
    end 
  end 

  # Delete entity with specified id
  def deleteTask(id)
    task_to_remove = nil
    @Tasks.each do |task|
      task_to_remove = task if task.ID == id 
    end 
    
    if task_to_remove != nil 
      @Tasks.delete(task_to_remove)
    else
      puts "No such task to delete"
    end 
  end 

private 

  # add a user to the whole list 
  def backend_addUser(param) 
    @Users.push(param) 
  end

  # backend_add a project to the whole list
  def backend_addProject(param) 
    @Projects.push(param) 
  end 

  # backend_add a task to the whole list 
  def backend_addTask(param) 
    @Tasks.push(param) 
  end 

  # delete the unwanted user 
  def backend_deleteUser(param) 
    @Tasks.delete(param) if @Tasks.include? param 
  end 

  # delete the unwanted project 
  def backend_deleteProject(param) 
    @Projects.delete(param) if @Projects.include? param 
  end 

  # delete the unwanted task 
  def backend_deleteTask(param) 
    @Tasks.delete(param) if @Projects.include? param 
  end 

end 
