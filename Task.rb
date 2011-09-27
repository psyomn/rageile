#author::Simon Symeonidis 
#Encapsulation for anything task related

load 'User.rb'

class Task 
  attr_accessor :Owner
  attr_accessor :AskedBy
  attr_accessor :EstimatedTime
  attr_accessor :ActualTime 
  attr_accessor :DateCreated
  attr_reader :ID

public
  # Initialize all 
  def initialize
    @Owner = nil 
	@ASkedBy = nil 
	@EstimatedTime = nil 
	@ActualTime = nil 
    @Created = Time.new
	@ID = @@count 
    @@count += 1
  end

  def start
  end

  def stop 
  end

  def to_s
    "Task Id: " + @ID.to_s
  end

private
  @@count = 0 

end 
