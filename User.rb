#author::Simon Symeonidis 
# Class for whatever user 

class User

  attr_accessor :Email
  attr_accessor :Name
  attr_accessor :Surname 
  attr_reader :ID 

public

  # 
  def initialize
    @Email = String.new 
    @Name = String.new 
    @Surname = String.new
    @ID = @@count 
    @@count += 1
  end 

  

private 
  @@count = 0

end 

