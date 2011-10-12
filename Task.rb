load 'User.rb'

# Author:: Simon Symeonidis 
# Encapsulation for anything task related

class Task 
  attr_accessor :Owners # Can be assigned to many people
  attr_accessor :AskedBy # Asked by 1 person 
  attr_accessor :EstimatedTime # The time estimated to complete artifact 
  attr_accessor :ActualTime # The actual time taken to complete this
  attr_accessor :DateCreated # when this artifact was created 

  attr_reader :Stopped # stop time 
  attr_reader :Started # start time 
  attr_reader :Comments # comments on tasks 
  attr_reader :ID # unique id of the task 

public
  # Initialize all 
  def initialize
    @Owner = Array.new
	@AskedBy = nil 
	@EstimatedTime = 0
	@ActualTime = Time.new
    @Created = Time.new
    @Started = Time.new 
    @Stopped = Time.new 
    @Comments = Array.new
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
    + "\nEstimated time: " + @EstimatedTime.to_s \
    + "\nActual time: " + @ActualTime.to_s \
    + "\nOwner: " + @Owner.to_s \
    + "\nAsked by: " + @AskedBy.to_s \
    + "\nCreated: " + @DateCreated.to_s \
    + "\nTodo: \n" 

  end

  # Add a comment to the task 
  def addComment ( comment ) 
    @Comments.push( comment ) 
  end 

  # Delete nth comment from the list 
  def deleteComment ( index ) 
    if index < @Comments.size 
      @Comments.delete_at( index ) 
    end
  end 

private
  @@count = 0 

end 
