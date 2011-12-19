require 'singleton' 

# This acts like a db registry. Singleton and allows the gateways
# to perform any needed db query. 
#Author::Simon Symeonidis 
def DBHandle 
  include Singleton 
  attr_reader :Handle

  # Upon initializement, create the connection to the database. 
  # The datbase name is retrieved from the .conf text file. 
  # Therefore notice how the Configuration class is used. 
  # Also, the database type is taken from the .conf file
  # and the appropriate handle is generated here as well.
  def initialize 
    @Handle = SQLite3::Database.new(Configuration.instance.Attributes["DATABASE_NAME"]) 
  end 

  # executes sql query, no return values 
  def executeUpdate(sql) 
    @Handle.execute(sql)
  end 

  # executes a sql query and has return values
  # This method should accept prepared statements
  def execute(sql) 
    return @Handle.execute(sql)
  end 

end 
