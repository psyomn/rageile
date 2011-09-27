#author::Simon Symeonidis 

load 'Task.rb'

class Project 

  attr_accessor :Tasks # list of tasks 
  attr_accessor :StartDate # The starting date of the project
  attr_accessor :EndDate # The ending date of the project 
  attr_accessor :Owner # The stakeholder of the project

  # initiliaze everything for the class
  def initialize
    # TODO 
    @Tasks = Array.new 
    @StartDate = Time.new 
    @EndDate = nil 
    @Owner = nil 
  end 

  # set the owner of the project 
  def setOwner(param) 
    @Owner = param 
  end

end 
