require_relative 'Literals.rb'

# This generates sqlite specific sql.
# It assumes that we wish to have sql that
# only has one primary key and that all entries
# are affected on the CRUD operations (where
# applicable) 
#Author::Simon Symeonidis 
class SQLHelperSQLite 
public 
  # Default initializement 
  def initialize 
    @SQLAttributes = Array.new 
    @Keys = Array.new 
  end 

  # Add an attribute to the sql model
  def addAttribute(name,type)
    if !Literals::SQLite.constants.include? type.to_sym
      raise NoSuchSQLiteType, "That type is not defined: #{type}"
    else 
      @SQLAttributes.push [name,type]
    end 
  end 

  # Will search for the attribute and set it as 
  # primary key in the sql
  def setKeyAttribute(name)
    found = false 
    @SQLAttributes.each do |att|
      found = true if att == name 
    end 

    raise "No such key" if !found 

    if !@Keys.include? name
      @Keys.push name 
    end
  end 

  # Create the table syntax
  def createTableSyntax
    
  end

  # Create the 'create' syntax
  def createSyntax
  end

  # Create the 'read' syntax 
  def readSyntax
  end

  # Create the 'delete' syntax 
  def deleteSyntax
  end 

  # Create the 'update' syntax 
  def updateSyntax
  end 
private 
  attr :SQLAttributes
  attr :Keys
end 
