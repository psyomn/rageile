require 'singleton' 

# Own classes
load 'Project.rb'
load 'Task.rb'
load 'User.rb'

#author::Simon Symeonidis 
# This class holds the data which needs to be accessible from
# all the ui elements. 
class Central 
public
  include Singleton

  # default initializement here
  def initialize 
    @Projects = Array.new 
    @Users = Array.new
    @Tasks = Array.new 
  end 

  # add a user to the whole list 
  def addUser(param) 
    @Users.push(param) 
  end

  # add a project to the whole list
  def addProject(param) 
    @Projects.push(param) 
  end 

  # add a task to the whole list 
  def addTask(param) 
    @Tasks.push(param) 
  end 

  # delete the unwanted user 
  def deleteUser(param) 
    @Tasks.delete(param) if @Tasks.include? param 
  end 

  # delete the unwanted project 
  def deleteProject(param) 
    @Projects.delete(param) if @Projects.include? param 
  end 

  # delete the unwanted task 
  def deleteTask(param) 
    @Tasks.delete(param) if @Projects.include? param 
  end 

private 
  attr_reader :Project
  attr_reader :Users
  attr_reader :Tasks 
end 
