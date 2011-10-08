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
    if param.is_a? User then storeUser(param) 
    elsif param.is_a? Task then storeTask(param) 
    elsif param.is_a? Stakeholder then storeStakeholder(param) 
    elsif param.is_a? Project then storeProject(param)
    else puts "I don't know how to store #{param.name} objects." end
  end

private 
  # Code for user storage goes here 
  def storeUser(param) 
  end 

  # Code for task storage goes here 
  def storeTask(param) 
  end 

  # Code for project storage goes here 
  def storeProject(param) 
  end 

  # Code for stakeholder storage goes here 
  def storeStakeholder(param) 
  end 

  # Create all the tables if they don't exist 
  # already 
  def createTables 
    createUserTable
    createTaskTable
    createProjectTable
  end 

  def createUserTable
    @Handle.execute( @UserSchema ) 
  end
  
  def createTaskTable
    @Handle.execute( @TaskSchema ) 
  end

  def createProjectTable
    @Handle.execute( @ProjectSchema ) 
  end

  def createStakeholderTable
    @Handle.execute( @StakeholderSchema ) 
  end

end 

