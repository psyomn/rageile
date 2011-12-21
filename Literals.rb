# This just stores literals which saves us
# from hardcoding them in many files. 
module Literals
  # Configuration file tag for sqlite type database
  CONF_SQLITE_TAG = "SQLITE"
  # Configuration file tag for mysql type database
  CONF_MYSQL_TAG = "MYSQL"

  # Specific module for sqlite nomenclature
  # I haven't added everything here because
  # reading upon the sqlite faqs, it seems 
  # that it would be nonsensical to do so.
  #   http://www.sqlite.org/datatype3.html
  module SQLite
    # Declaring a primary key
    PRIMARY_KEY = "PRIMARY KEY"
    # Declaring 
    INTEGER = "INTEGER"
    # Declaring a text type
    TEXT = "TEXT" 
    # Declaring a blob type
    BLOB = "BLOB" 
    # Declaring a real type 
    REAL = "REAL"
    # Declaring a double type
    DOUBLE = "REAL"
    # Declaring a float type
    FLOAT = "REAL"
    # Declaring a numeric type
    NUMERIC = "NUMERIC"
    # Declaring a decimal type
    DECIMAL = "NUMERIC"
    # Declaring a boolean type
    BOOLEAN = "NUMERIC"
    # Declaring a date type
    DATE = "NUMERIC"
    # Declaring a datetime type
    DATETIME = "NUMERIC"
  end 

  # TODO implement mysql literals when needed
  module MySQL 
  end 
end 
