require_relative 'CLIManageTasks.rb'
require_relative 'Server.rb'

# Class that controls the source of the input 
#Author::Simon Symeonidis 
class Controller 

  attr_reader :Mode

  # Standard initialization requires a parameter
  # which is the mode in which the application 
  # should run. This is inserted form the run.rb 
  # script. 
  # Current possible parameters are : 
  #   cli 
  #   clientserver
  # !Warning! clientserver is not implemented at
  # the momment. 
  def initialize(mode) 
    @Mode = mode 

    case @Mode 
      when "cli" 
        cli
      when "clientserver"
        clientserver
    end 
  end 

private 

  # The implementation of the command line interface 
  def cli
    CLIManageTasks.new    
  end 

  # The implementation of the server-client interface
  # TODO
  def clientserver
  end 

end 
