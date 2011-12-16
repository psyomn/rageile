load 'Configuration.rb'
load 'DBSqlite3.rb'
load 'DBMySQL.rb'

#author::Simon Symeonidis 
# Class which should take care of storing different objects
class Storage 

  attr_reader :Database

public 
  # default initializement 
  def initialize 
    case Configuration.instance.Attributes["DATABASE"]
      when "SQLITE"
        @Database = DBSqlite3.new 
      when "MYSQL" 
        @Database = DBMySQL.new 
    end 
  end 

  def store(param)
    @Database.store(param)
  end 
  
private 

end 
