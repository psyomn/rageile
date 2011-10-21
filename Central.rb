#author::Simon Symeonidis 
# This class holds the data which needs to be accessible from
# all the ui elements. 

require 'singleton' 

# Own classes
load 'Project.rb'
load 'Task.rb'
load 'User.rb'

class Central 
public
  include Singleton

  # default initializement here
  def initialize 
  end 

private 
  
end 
