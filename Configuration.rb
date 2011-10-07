#author::Simon Symeonidis 
#Simple class which reads a configuration text file

require 'singleton' 

class Configuration 
public 
  include Singleton 
  attr_reader :Filename 
  attr_reader :Attributes 
  
  # default init 
  def initialize
    @Filename = ".conf" 
    @Attributes = Hash.new 
    parse 
  end

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
