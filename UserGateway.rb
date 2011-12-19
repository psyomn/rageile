require_relative 'DBHandle.rb'

# Gateway class for user objects
#Author::Simon Symeonidis
class UserGateway
    
  attr_reader :TableSchemaSql
  attr_reader :UpdateSql
  attr_reader :DeleteSql
  attr_reader :InsertSql

  # Initialize the gateway here
  # TODO the rest of the sql :P
  def initialize 
    @TableSchemaSql =
      "CREATE TABLE IF NOT EXISTS User(ID INTEGER PRIMARY KEY, " +\
      "email char(255), name char(50), surname char(50), nickname char(50) )"
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
