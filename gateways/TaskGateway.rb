require_relative 'DBHandle.rb'
# This is the gateway for task persistance. 
#Author::Simon Symeonidis 
class TaskGateway
public  
  attr_reader :TableSchemaSql
  attr_reader :UpdateSql
  attr_reader :DeleteSql
  attr_reader :InsertSql

  # Standard init
  def initialize 
    @TableSchemaSql = 
      "CREATE TABLE IF NOT EXISTS Task(ID INTEGER PRIMARY KEY ASC, " +\
      "OWNER_ID INTEGER, askedbyID INTEGER, estimated_time INTEGER, " +\
      "actual_time INTEGER, date_created DATETIME, " +\
      "FOREIGN KEY(OWNER_ID) references User(ID), " +\
      "FOREIGN KEY(askedbyID) references User(ID) )"
    @uPDATEsQL = 
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
  attr :DBHandle
end

