#Author::Simon Symeonidis 
#Test the project class 

load 'Task.rb' 
load 'Project.rb' 

t = Task.new 
p = Project.new 

p.add t 

t = Task.new 

p.add t

t = Task.new 

p.add t 

puts p.get(0) 
puts p.get(100) 
