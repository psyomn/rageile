#author::Simon Symeonidis 
#Test case for the DBSqlite3.rb class

load 'DBSqlite3.rb'
load 'User.rb' 
load 'Stakeholder.rb' 
load 'Task.rb'
load 'Project.rb' 

tdb = DBSqlite3.new 

user = User.new ( "testuser" ) 
stake = Stakeholder.new 
task = Task.new 
proj = Project.new 

tdb.store(user) 
tdb.store(stake) 
tdb.store(task) 
tdb.store(proj) 


