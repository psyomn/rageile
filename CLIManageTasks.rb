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
      when "createTask"
        createTask
      when "createuser"
        createUser
      when "createtask"
        createTask
      when "createproject"
        createProject
      when "addtasktoproject"
        addTaskToProject
      when "addusertoproject"
        addUserToProject
      when "showusers"
        showUsers
      when "showprojects"
        showProjects
      when "showtasks"
        showTasks
      when "end"
        @Done = true 
      else 
        puts "Unknown Command"
    end
  end

private 
  # Add a user to the project
  def addUserToProject
    print " Users: " 
    
    Central.instance.Users.each_with_index do |user,i|
      puts "  " + i.to_s + " " + user.to_s
    end

    Central.instance.Projects.each_with_index do |project,i| 
      puts "  " + i.to_s + " " + project.to_s 
    end 

    # See who we want to add to this to
    print " Assign user id :"
    usrid = $stdin.gets.to_i 
    print " To project id  :"
    proid = $stdin.gets.to_i 

    Central.instance.addUserToProject(usrid,proid)
  end

  # delete task from a project 
  def deleteTask(id) 
    Central.instance.deleteTask(id) 
  end 

  # delete the user from the repository
  def deleteUser(id) 
    Central.instance.deleteTask(id)
  end 

  # Search for a task
  #  param is the key to search
  def search(param) 
  end 

  # To add a task to a project
  def addTaskToProject
    puts "Tasks:"
    Central.instance.Tasks.each do |task|
      puts task.ID.to_s + " " + task.Description
    end 
    puts "Projects:"
    Central.instance.Projects.each do |project| 
      puts project.ID.to_s + " " + project.Description
    end 
    puts "Assign Task ID:"
    taskid = $stdin.gets.to_i 
    puts "To project ID:" 
    projid = $stdin.gets.to_i
    
  end 

  # function to create a new user
  def createUser
    puts "User nickname:"
    begin
      nick = $stdin.gets.chomp!
      Central.instance.createUser(nick) 
    rescue => details 
      puts details.message
      retry
    end
  end 

  # function to create a new project
  def createProject
    print "Project Description: "
    desc = $stdin.gets.chomp! 
    Central.instance.createProject(desc)
  end 

  # Create a new task 
  def createTask
    print " Task description: "
    desc = $stdin.gets.chomp! 
    Central.instance.createTask(desc) 
  end 

  # Print Tasks
  def showTasks
    puts Central.instance.Tasks.to_s
  end 

  # Print Projects
  def showProjects
    puts Central.instance.Projects.to_s
  end 

  # Print Users
  def showUsers
    puts Central.instance.Users.to_s
  end 

end

