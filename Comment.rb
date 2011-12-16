require_relative 'User.rb' 

#author::Simon Symeonidis 
# Class to handle simple comments 
# TODO figure out why the hell this is here...
class Comment 
  attr_reader :ID # the id of the current task 
  attr_reader :Owner # the user that commented on this 
  attr_accessor :Text # the text of the comment 

  def initialize 
    @ID = @@count 
    @@count += 1
    
    @Owner = nil  
    @Text = "Default text" 
  end 

public 

private 
  @@count = 0 
end 
