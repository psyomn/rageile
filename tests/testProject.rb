#Author::Simon Symeonidis 
#Test the project class 

Dir.chdir("../")

require_relative '../Task.rb' 
require_relative '../Project.rb' 

t = Task.new 
p = Project.new 

p.add t 

t = Task.new 

p.add t

t = Task.new 

p.add t 

puts p.get(0) 
puts p.get(100) 
