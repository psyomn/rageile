load 'User.rb'

# Author:: Simon Symeonidis 
# Encapsulation for anything task related

class Task 
  attr_accessor :Owner
  attr_accessor :AskedBy
  attr_accessor :EstimatedTime
  attr_accessor :ActualTime 
  attr_accessor :DateCreated

  attr_reader :Stopped
  attr_reader :Started
  attr_reader :Comments # comments on tasks 
  attr_reader :ID

public
  # Initialize all 
  def initialize
    @Owner = nil 
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
    + "\nCreated: " + @DateCreated.to_s 
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
