require_relative '../SQLHelperSQLite.rb'
require_relative '../Literals.rb'

# Simple demonstration on how the sqlite helper works

sql = SQLHelperSQLite.new 

sql.addAttribute("ID",Literals::SQLite::INTEGER)
sql.addAttribute("name",Literals::SQLite::TEXT) 
sql.addAttribute("surname",Literals::SQLite::TEXT) 
sql.addAttribute("age",Literals::SQLite::INTEGER) 
sql.addAttribute("post",Literals::SQLite::INTEGER)

sql.addKey "ID"
sql.setTableName "derp"
sql.addForeignKey "name","tableofnames(name)"
sql.addForeignKey "derpy2","tableofnames(derpy2)"

puts "Create Table" 
puts "  " + sql.createTableSyntax
puts "Create" 
puts "  " + sql.createSyntax
puts "Read" 
puts "  " + sql.readSyntax
puts "Delete" 
puts "  " + sql.deleteSyntax

puts "Update" 
puts "  " + sql.updateSyntax
