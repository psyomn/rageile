#author::Simon Symeonidis
#Simple task manager cli interface. 

require_relative 'Central.rb'

class CLIManageTasks

  attr :Done 

public 
  #default initializement code 
  def initialize 
    puts "Started RAGEILE with the CLI manager."
    @Done = false 
    start 
  end 

  # Main execution loop
  def start

    while !@Done do 
      print ">" 
      cmd = $stdin.gets
      
      if cmd != nil 
        cmd.chomp! 
        execute(cmd) 
      else 
        @Done = true 
      end
    
    end 

  end 

  # Parse the action to perform. 
  def execute(param) 
    case param
      when "add"
        add
      when "end"
        @Done = true 
    end
  end

private 
  # add task to a project
  def add
    print " Task description: " 
    desc = $stdin.gets
    desc.chomp! 
    
    puts "  -1 don't assign user"
    Central.instance.Users.each_with_index do |user,i|
      puts "  " + i.to_s + " " + user.to_s
    end

    # See who we want to add to this to
    print " Assign user:"
    usrid = $stdin.gets.to_i 



  end

  # delete task from a project 
  def delete 
  end 

  # Search for a task
  #  param is the key to search
  def search(param) 
  end 

end

