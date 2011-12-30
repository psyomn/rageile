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
    @ForeignKeys = Array.new
    @SQLAttributes = Array.new 
    @Keys = Array.new 
    @TableName = nil
  end 

  # Add an attribute to the sql model
  def addAttribute(name,type)
    if !Literals::SQLite.constants.include? type.to_sym
      raise NoSuchSQLiteType, "That type is not defined: #{type}"
    else 
      @SQLAttributes.push [name,type]
    end 
  end 

  def setTableName(name)
    @TableName = name 
  end 

  # Will search for the attribute and set it as 
  # primary key in the sql
  def addKey(name)
    found = false 
    @SQLAttributes.each do |att|
      found = true if att[0] == name 
    end 

    raise "No such key" if !found 

    if !@Keys.include? name
      @Keys.push name 
    end
  end 

  # Adds a foreign key to the list
  # Rejects the key if it's already in the list
  # Please note that this is not checked against
  # other tables. 
  # This should also check that the foreign key exists 
  # in the main sql attributes
  def addForeignKey(name,tablearg) 
    if !@ForeignKeys.include? name 
      @ForeignKeys.push [name,tablearg]
    else 
      raise "That key already exists or does not exist in attributes" 
    end 
  end 

  # Create the table syntax
  def createTableSyntax
    raise "Table name not set" if @TableName == nil 
    return "CREATE TABLE IF NOT EXISTS " + @TableName + "(" + attributesToString + ");"
  end

  # Create the 'create' syntax
  def createSyntax
    raise "Table name not set" if @TableName == nil 
    return "INSERT INTO TABLE " + @TableName + "(" + varNames + ")" +\
      " values (" + valuesToString + ");"
  end

  # Create the 'read' syntax. This will return all the entries
  # inside the current table
  def readSyntax
    raise "Table name not set" if @TableName == nil 
    return "SELECT * FROM " + @TableName + ";"
  end

  # Create the 'delete' syntax 
  def deleteSyntax
    raise "Table name not set" if @TableName == nil 
    return "DELETE FROM " + @TableName + " WHERE " + @Keys[0] + "=?;" 
  end 

  # Create the 'update' syntax 
  def updateSyntax
    raise "Table name not set" if @TableName == nil 
    return "UPDATE " + @TableName + " SET " + updateValuesSyntax + " WHERE " + @Keys[0] + "=?;"
  end 

  # Just for testing purposes.
  def debug
    @SQLAttributes.to_s + "\n" + @Keys.to_s
  end 
private 
  attr :SQLAttributes
  attr :Keys
  attr :ForeignKeys
  attr :TableName

  # Returns all the attributes as a string. The format
  # is the name with the type. eg: 
  #   name text, id integer, surname text
  # This includes the rest of the attributes such as 
  # foreign keys and primary keys. Please note that
  # these validities of said keys are not checked but 
  # just generated as sql. This is a sql helper class
  # after all :)
  def attributesToString
    str = ""
    counter = 0
    @SQLAttributes.each { |attribute| 
      str += attribute[0] + " " + attribute[1] + ","
    }
    # remove the trailing comma
    str.chop!

    str += ","
    str += primaryKeysToString

    str += ","
    str += foreignKeysToString

    return str
  end

  # returns the variable names on their own
  #   eg: (name,surname,age)
  def varNames
    str = String.new 
    @SQLAttributes.each do |attribute|
      if !@Keys.include? attribute[0]
        str += attribute[0] 
        str += ","
      end 
    end 
    str.chop! if str != nil
    return str
  end 

  # Returns the placeholder string values
  # This excludes keys when counting the number of 
  # placeholder attributes to return
  #   eg: (name,surname,derp) values (?,?,?);  
  # Note: This just counts and returns the right amount
  # of question marks 
  def valuesToString
    str = String.new 
    (@SQLAttributes.size - @Keys.size).times do 
      str += "?," 
    end
    str.chop!
  end 

  # Return the values for the update syntax.
  #   eg: name=?,surname=?,age=?
  def updateValuesSyntax
    str = String.new 
    @SQLAttributes.each do |attribute| 
      if !@Keys.include? attribute[0]
        str += attribute[0] + "=?,"
      end 
    end 
    str.chop! 
    return str
  end 

  # Returns the primary keys as a string
  def primaryKeysToString
    str = String.new 
    @Keys.each do |key| 
      str += "PRIMARY KEY ("
      str += key 
      str += ")" 
      str += ","
    end 
    str.chop!
    return str
  end 

  # Returns the stringified version of 
  def foreignKeysToString
    str = String.new 
    @ForeignKeys.each do |key| 
      str += "FOREIGN KEY " 
      str += "("
      str += key[0]
      str += ")" 
      str += " REFERENCES "
      str += key[1]
      str += ","
    end 
    str.chop!
    return str
  end 
end 
