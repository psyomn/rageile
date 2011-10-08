#author::Simon Symeonidis 
#Test case for the DBSqlite3.rb class

load 'DBSqlite3.rb'
load 'User.rb' 
load 'Stakeholder.rb' 
load 'Task.rb'
load 'Project.rb' 

tdb = DBSqlite3.new 

faultystring = String.new
faultyhash = Hash.new

user = User.new ( "testuser" ) 
user.Name = "Simon" 
user.Surname = "Symeonidis" 
user.Email = "send@me.something" 

user2 = User.new ( "someone" ) 
user2.Name = "John" 
user2.Surname = "Connor" 
user2.Email = "riseagainstthemachines@derp.com" 

stake = Stakeholder.new 
stake.Name = "stan" 
stake.Surname = "idiotz" 
stake.Company = "Something" 

task = Task.new 
task.AskedBy = user2
task.Owner = user
task.ActualTime = Time.new

proj = Project.new 
proj.Owner = user

tdb.store(user) 
tdb.store(user2) 
tdb.store(stake) 
tdb.store(task) 
tdb.store(proj) 

#failcases
tdb.store(faultystring)
tdb.store(faultyhash) 

