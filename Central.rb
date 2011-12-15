require 'singleton' 

# Own classes
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

  # Add a task to a project
  def addTask
  end 

  # Add a project. 
  def addProject
  end 

  # Add a user. 
  def addUser
  end 

  # Delete entity with specified id
  def deleteUser(id) 
  end

  # Delete entity with specified id
  def deleteProject(id) 
  end 

  # Delete entity with specified id
  def deleteTask(id)
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
