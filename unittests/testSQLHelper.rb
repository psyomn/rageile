require 'test/unit'

require_relative '../SQLHelperSQLite.rb'

# Test case for sqlite driver 
#Author::Simon Symeonidis
class TestSQLHelper < Test::Unit::TestCase 
  
  def setup
    puts "Test for SQLITE3 helper"
  end 

  def test_literal_not_included_in_module
    #assert_raise do 
    #  sql = SQLHelperSQLite.new 
    #  sql.addAttribute("name","nothinghere")
    #end 
  end 

end 
