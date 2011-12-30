require_relative 'Task.rb'
require_relative 'User.rb'

# Class which takes care of information and functionality
# of projects.
#Author::Simon Symeonidis 
class Project 
  # list of tasks 
  attr_reader :Tasks 
  # Unique id of the project
  attr_reader :ID  
  # The starting date of the project
  attr_accessor :StartDate 
  # The ending date of the project 
  attr_accessor :EndDate 
  # The stakeholders of the project
  attr_accessor :Owners 
  # Simple description of the project 
  attr_accessor :Description 

public 
  # initiliaze everything for the class
  def initialize
    @ID = @@count
    @@count += 1

    @Tasks = Array.new 
    @StartDate = Time.new 
    @EndDate = nil 
    @Owners = Array.new  
  end 

  # Add task parameter 
  # TODO have to check for duplicates in the future
  def addTask(t) 
    @Tasks.push(t) 
  end 

  # Get task by id
  def getTaskByID(id) 
    @Tasks.each do |task|
      return task if task.ID == id
    end
    return nil 
  end 

  # add a user as an owner to the project
  def addOwner(user)
    @Owners.push(user) if !@Owners.include? user
  end 

  # stringify the information of the project
  def to_s 
    str = String.new 
    
    str += @ID.to_s
    str += " - " 
    str += @Description
    str += " - "
    str += @Owners.to_s
    str += " - " 
    str += @Tasks.to_s
    return str 
  end 

private 
  @@count = 0
end 
