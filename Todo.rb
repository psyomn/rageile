#author::Simon Symeonidis
# Class to store the todo lists for whatever that might be needed 

class Todo 
  attr_accessor :Description # Description of todo item 
  attr_reader :Done # Done or not 
  attr_reader :ID # unique ID for tasks
public 

  # Standard initializement 
  def initialize 
    @ID = @@count 
    @@count += 1
    @Done = false 
    @Description = "Default" 
  end 
  
  # Finish the current todo item 
  def finish
    @Done = true 
  end 

  # Start the current todo item 
  def start 
    @Done = false 
  end 

private 
  @@count = 0 

end 
