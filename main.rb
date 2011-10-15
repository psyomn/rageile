#author::Simon Symeonidis 
#Main interface for whatever. Authtest. 

load 'Project.rb'
load 'GUIMain.rb'

projects = Array.new 

app = Qt::Application.new(ARGV) 
gui = GUIMain.new 
gui.show
app.exec

