#author::Simon Symeonidis 
# Class which holds information about stakeholder 
load 'User.rb' 

class Stakeholder < User 
  attr_reader :ID 
  attr_accessor :Name
  attr_accessor :Surname 
  attr_accessor :Company 
  attr_accessor :Description 

public

  def initialize 
    @ID = @@count
    @@count += 1 
    @Name = String.new 
    @Surname = String.new
    @Company = String.new 
    @Description = String.new 
  end 

private
  @@count = 0 
end 
