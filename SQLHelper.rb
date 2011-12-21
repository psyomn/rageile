# This class will take care of generating the proper sql for
# the user. It is initialized with the specific database needed
# and generates the appropriate sql in such respect. (This is
# to provide multiple database support if needed in the future, 
# and there could be name clashes; also hardcoding sql is stupid)
#Author::Simon Symeonidis
require 'singleton'

require_relative 'Configuration.rb'
require_relative 'Literals.rb'

class SQLHelper 
  include Singleton
public 
  
  # Default initializement. The class is responsible of 
  # finding out what the database wanted is and hence generating
  # the appropriate sql.
  def initialize
    case Configuration.instance.Attributes["DATABASE"]
      when Literals::CONF_SQLITE_TAG 
        @SQLHandler = SQLHelperSQLite.new  
      when Literals::CONF_MYSQL_TAG
        raise "Not implemented yet (mysql)"
      else
        raise "Bad database type specified in .conf file"
    end 
  end 

  def addAttribute(name,type)
    @SQLHandler.addAttribute
  end 

  def tableSyntax
    @SQLHandler.createTable
  end

  def createSyntax
    @SQLHandler.create
  end

  def readSyntax
    @SQLHanlder.read
  end

  def deleteSyntax
    @SQLHandler.delete
  end 

  def updateSyntax
    @SQLHandler.update
  end 


private
  attr :SQLHandler
end 
