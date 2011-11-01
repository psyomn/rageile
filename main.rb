#author::Simon Symeonidis 
#Main interface for whatever. Authtest. 

load 'Project.rb'
load 'GUIMain.rb'
load 'Central.rb' 

projects = Array.new 
Central.instance 
app = Qt::Application.new(ARGV) 
gui = GUIMain.new 
gui.show
app.exec

