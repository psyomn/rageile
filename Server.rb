# Generic server for the main program to listen from clients
# and interact with. This shall be a front end to the main
# system. 
#Author::Simon Symeonidis 

require 'socket'

require_relative 'Configuration.rb'

class Server 

  attr_reader :Port
  attr_reader :ReceiveBuffer

  # For new object creation 
  def initialize 
    puts "Started server on port : " + Configuration.instance.Attributes["PORTLISTEN"]
    @Port = (Configuration.instance.Attributes["PORTLISTEN"]).to_i
  end 

  def run 

  end 

end 
