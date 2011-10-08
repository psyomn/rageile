#author::Simon Symeonidis 
# Simple class to offer shorthands in manipulating sqlite3 databases

require 'sqlite3'

load 'Configuration.rb'
load 'User.rb'
load 'Stakeholder.rb'
load 'Task.rb'
load 'Project.rb'

class DBSqlite3
  attr_reader :UserSchema
  attr_reader :TaskSchema
  attr_reader :ProjectSchema
  attr_reader :StakeholderSchema 
  attr_reader :Handle

public 
  def initialize
    @UserSchema =\
      "CREATE TABLE IF NOT EXISTS User(ID INTEGER PRIMARY KEY ASC, " +\
      "email char(255), name char(50), surname char(50), nickname char(50) )"
    @TaskSchema = 
      "CREATE TABLE IF NOT EXISTS Task(ID INTEGER PRIMARY KEY ASC, " +\
      "OWNER_ID INTEGER, askedbyID INTEGER, estimated_time INTEGER, " +\
      "actual_time INTEGER, date_created DATETIME, " +\
      "FOREIGN KEY(OWNER_ID) references User(ID), " +\
      "FOREIGN KEY(askedbyID) references User(ID) )"
    @ProjectSchema =
      "CREATE TABLE IF NOT EXISTS Project(ID INTEGER PRIMARY KEY ASC, " +\
      "startdate DATETIME, enddate DATETIME, ownerID INTEGER, " +\
      "FOREIGN KEY(ownerID) references User(ID) )"
    @StakeholderSchema = 
      "" # TODO 

    @Handle = SQLite3::Database.new( Configuration.instance.Attributes["DATABASE_NAME"] ) 
    
    createTables 
  end

  # This method will check the infered type and will
  # store the entity accordingly 
  def store(param)
    if (param.is_a? Stakeholder) ^ (param.is_a? User) 
      storeUser(param) 
    elsif param.is_a? Task 
      storeTask(param) 
    elsif (param.is_a? Stakeholder) 
      storeStakeholder(param) 
    elsif param.is_a? Project 
      storeProject(param)
    else 
      puts "I don't know how to store those objects." end
  end

private 
  # Code for user storage goes here 
  def storeUser(param) 
    @Handle.execute("INSERT INTO User(email,name,surname,nickname)" +
    " values ('#{param.Email}','#{param.Name}','#{param.Surname}','#{param.Nickname}')")
  end 

  # Code for task storage goes here 
  def storeTask(param) 
    @Handle.execute("INSERT INTO Task(OWNER_ID,askedbyID,estimated_time,actual_time,date_created)" +
    " values ('#{param.Owner.ID}','#{param.AskedBy.ID}','#{param.EstimatedTime.to_s}','#{param.ActualTime.to_s}','#{param.DateCreated.to_s}')")
  end 

  # Code for project storage goes here 
  def storeProject(param) 
    @Handle.execute("INSERT INTO Project(startdate,enddate,ownerID)" +
    " values ('#{param.StartDate.to_s}','#{param.EndDate.to_s}','#{param.Owner.ID}')")
  end 

  # Code for stakeholder storage goes here 
  def storeStakeholder(param) 
    #TODO
  end 

  # Create all the tables if they don't exist 
  # already 
  def createTables 
    createUserTable
    createTaskTable
    createProjectTable
  end 

  # Create the user table if not exists
  def createUserTable
    @Handle.execute( @UserSchema ) 
  end
  
  # Create the task table if not exists
  def createTaskTable
    @Handle.execute( @TaskSchema ) 
  end

  # Create the project table if not exists
  def createProjectTable
    @Handle.execute( @ProjectSchema ) 
  end

  # Create the stakeholder table if not exists
  def createStakeholderTable
    @Handle.execute( @StakeholderSchema ) 
  end

end 

