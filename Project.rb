require_relative 'Task.rb'

# Class which takes care of information and functionality
# of projects.
#Author::Simon Symeonidis 
class Project 

  attr_reader :Tasks # list of tasks 
  attr_reader :ID  # Unique id of the project
  attr_accessor :StartDate # The starting date of the project
  attr_accessor :EndDate # The ending date of the project 
  attr_accessor :Owners # The stakeholders of the project
  attr_accessor :Description # Simple description of the project 

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
    return str 
  end 

private 
  @@count = 0
end 
