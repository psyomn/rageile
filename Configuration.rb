require 'singleton' 

#Author::Simon Symeonidis
# Simple class which reads a configuration text file .conf 
# It also provides the interfaces with a standard stylesheet which is currently hardcoded
# TODO in the future, the stylesheet should be acquired from a different folder. 

class Configuration 
public 
  include Singleton 
  attr_reader :Filename 
  attr_reader :Attributes 
  attr_reader :styleSheet # TODO this has to go away
  
  # default init 
  def initialize
    @Filename = ".conf" 
    @Attributes = Hash.new 
    @styleSheet = "QWidget {background-color:#202020; color:#00AABB;} QPushButton{border:1px solid #008877; padding:3px;} QPushButton:hover{background-color:#004455;}"
    parse 
  end

  # Only use with test cases. 
  def debug
    p @Attributes 
  end 

private

  # read the file and add the attributes
  def parse
    if File.exist? @Filename 
      File.open(@Filename).each{ |line| 
        @Attributes[line.split[0]] = line.split[1]
      }
    else 
      File.open(@Filename, 'w') 
    end 
  end

end 
