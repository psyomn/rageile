require_relative 'User.rb'
require_relative 'Todo.rb'

# Author:: Simon Symeonidis 
# Encapsulation for anything task related
# TODO Must add Task type 
class Task 
  # Can be assigned to many people
  attr_accessor :Owners 
  # Asked by 1 person. This is added because when someone asks something
  # and later on requirements are evaluated and found out to be inconsistent,
  # we have a subject we can look back to and 
  attr_accessor :AskedBy 
  # The time estimated to complete artifact 
  attr_accessor :EstimatedTime 
  # The actual time taken to complete this
  attr_accessor :ActualTime 
  # when this artifact was created 
  attr_accessor :DateCreated 
  # Description of the task
  attr_accessor :Description # TODO 
  # Type of task (new feature, improvement,...)
  attr_reader :TaskType

  # stop time 
  attr_reader :Stopped 
  # start time
  attr_reader :Started 
  # comments on tasks 
  attr_reader :Comments 
  # unique id of the task 
  attr_reader :ID 
 
  # TODO need to see if I want this level of nesting
  attr_reader :TodoList 

  # attr_accessor :Dependencies # If this task depends on other tasks TODO check if we actually want this

public
  # Initialize all 
  def initialize
    @Owners = Array.new
	@AskedBy = nil 
	@EstimatedTime = 0
	@ActualTime = Time.new
    @Created = Time.new
    @Started = Time.new 
    @Stopped = Time.new 
    @Comments = Array.new
    @TodoList = Array.new 
	@ID = @@count 
    @@count += 1
  end
  
  #Start the task here store the timestamp 
  def start 
    @Started = Time.new
  end

  #Stop the task, record the difference in time
  def stop 
    @Stopped = Time.new 
    @ActualTime = @Stopped - @Started 
  end

  # To string method 
  def to_s
    "Task Id: " + @ID.to_s \
    + " Estimated time: " + @EstimatedTime.to_s \
    + " Actual time: " + @ActualTime.to_s \
    + " Owner: " + @Owner.to_s \
    + " Asked by: " + @AskedBy.to_s \
    + " Created: " + @DateCreated.to_s \
    + " Todo: \n" 
  end

  # Add a comment to the task 
  def addComment(comment) 
    @Comments.push(comment) 
  end 

  # Delete nth comment from the list 
  def deleteComment(index) 
    if index < @Comments.size 
      @Comments.delete_at(index) 
    end
  end 

  # Add a todo item in the list to show that this artifact
  # is composed by smaller steps 
  def addTodoItem(param) 
    @TodoList.push(param) 
  end 

  # delete the todo item from the task list 
  def deleteTodoItem(param)
    @TodoList.delete(param) 
  end 

  # Add a user to the owner list 
  def addOwner(user)
    @Owners.push(user) 
  end 
 
  # Called to set the task type as normal
  def isNormal
    @TaskType = 0
  end  

  # Called to set the task type as a new feature
  def isAFeature
    @TaskType = 1
  end 

  # Called to set the task type as an improvement
  def isAImprovement 
    @TaskType = 2 
  end 

private
  @@count = 0 

end 
