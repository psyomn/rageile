require_relative 'DBHandle.rb'

# Gateway for a single project. 
#Author::Simon Symeonidis 
class ProjectGateway 
public   
  attr_reader :TableSchemaSql
  attr_reader :UpdateSql
  attr_reader :DeleteSql
  attr_reader :InsertSql

  # Standard init
  def initialize 
    @TableShemaSql =
      "CREATE TABLE IF NOT EXISTS Project(ID INTEGER PRIMARY KEY ASC, " +\
      "startdate DATETIME, enddate DATETIME, ownerID INTEGER, " +\
      "FOREIGN KEY(ownerID) references User(ID) )"
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
  attr :DBHandle
end 

