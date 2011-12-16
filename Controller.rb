require_relative 'CLIManageTasks.rb'
require_relative 'Server.rb'

# Class that controls the source of the input 
#Author::Simon Symeonidis 
class Controller 

  attr_reader :Mode

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
  def clientserver
  end 

end 
