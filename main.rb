#author::Simon Symeonidis 
#Main interface for whatever. Authtest. 

load 'CLIManageTasks.rb'

taskManager = CLIManageTasks.new 
action = String.new 

# Main loop 

while action !~ /END/i 
  print "> "
  action = $stdin.gets
  action.chomp! 

  case action
    when "help"
      puts "help - show help info" 
    when /task/ 
      taskManager.execute action 
    when /end/i 
      puts "Bye." 
    else 
      puts "No such command. Type help"
  end
end 


