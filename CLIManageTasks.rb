require_relative 'Central.rb'

#author::Simon Symeonidis
# Simple task manager cli interface. This is mainly to 
# make sure that the integrity of the model is ok. 
# Not goint to spend too much time here since this is
# mainly for testing :). 
class CLIManageTasks

public 
  #default initializement code 
  def initialize 
    puts "Started RAGEILE with the CLI manager."
    @Done = false 
    start 
  end 

  # Main execution loop. @Done is set
  # to true in the execute function if 
  # the user enters "end"
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

  # Parse the action to perform. Each
  # command is mapped to a function. 
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
      when "edituser" 
        editUser
      when "editproject" 
        editProject
      when "editTask"
        editTask
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
      when "showall"
        showAll
      when "end"
        @Done = true 
      else 
        puts "Unknown Command"
    end
  end

private 
  
  # this is used for the execution loop
  attr :Done 

  # Add a user to the project by specifying the unique ids
  # of both.
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

  # To add a task to a project by specifying the unique
  # ids of both
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
    Central.instance.addTaskToProject(taskid,projid) 
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

  # Function to create a new user. Raises
  # an exception if the user already exists.
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

  # Print all 
  def showAll
    showTasks
    showProjects
    showUsers
  end 

  # Edit a particular user
  def editUser
    showUsers
    print "Edit user with ID: " 
    userid = $stdin.gets.to_i 

    user = Central.instance.getUserByID(userid) 
    
    if user == nil 
      puts "No such user."
      return
    end

    puts "(Press ctrl+d in order not to change a value)"
    print "New Name:"
    newname = $stdin.gets 
    user.Name = newname.chomp! if newname != nil 

    print "New Surname:"
    newsurname = $stdin.gets
    user.Surname = newsurname.chomp! if newsurname != nil 
    
    print "New Nickname:" 
    begin 
      new_user_name = $stdin.gets
      user.setNewNickname(new_user_name.chomp!) if new_user_name != nil  
    rescue => details
      puts details.message
      retry
    end

    print "New Email:" 
    begin
      new_email = $stdin.gets 
      user.setNewEmail(new_email.chomp!) if new_email != nil 
    rescue => details 
      puts details.message
      retry
    end

    print "New Password:" 
    newpassword = $stdin.gets
    user.Password = newpassword.chomp! if  newpassword != nil 

    print "New description:"
    newdescription = $stdin.gets
    user.Description = newdescription.chomp! if newdescription != nil 
  end 

  # Edit a particular project
  def editProject
    showProjects
    print "Edit project with ID: " 
    proid = $stdin.gets.to_i
  end 

  # Edit a particular task
  def editTask
    showTasks
    print "Edit task with ID: " 
    taskid = $stdin.gets.to_i
  end 

end

