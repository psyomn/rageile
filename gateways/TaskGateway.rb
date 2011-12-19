require_relative 'DBHandle.rb'
# This is the gateway for task persistance. 
#Author::Simon Symeonidis 
class TaskGateway
public  
  # The schema of the main database stored as a string
  attr_reader :TableSchemaSql
  # The standard update query
  attr_reader :UpdateSql
  # the standard delete query
  attr_reader :DeleteSql
  # the standard query
  attr_reader :InsertSql

  # the list of owners table for a particular task 
  attr_reader :

  # Standard init
  def initialize 

    #Define the table name 
    @Tablename = "Task"

    @TableSchemaSql = 
      "CREATE TABLE IF NOT EXISTS Task(ID INTEGER PRIMARY KEY ASC, " +\
      "OWNER_ID INTEGER, askedbyID INTEGER, estimated_time INTEGER, " +\
      "actual_time INTEGER, date_created DATETIME, " +\
      "FOREIGN KEY(OWNER_ID) references User(ID), " +\
      "FOREIGN KEY(askedbyID) references User(ID) )"
    @TableSchemaSql = 
      "CREATE TABLE IF NOT EXISTS " + @Tablename + "(" +\
      "ID INTEGER PRIMARY KEY" +\
      ",ownerids INTEGER" +\
      ",askedbyid INTEGER FOREIGN KEY()"
    @UpdateSql = 
      ""
    @DeleteSql = 
      "" 
    @InsertSql = 
      "" 
  end 

  # Create a task entry
  def create 
  end 

  # Read a task entry 
  def read
  end 

  # update a task entry
  def update
  end 

  # delete a task entry
  def delete
  end 
private 
  # The database connection used in order to execute queries
  attr :DBHandle
  # The table name (stored in this variable in order to avoid hardcoding!)
  attr :Tablename
end

