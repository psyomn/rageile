#author::Simon Symeonidis 
# This boots up the main interface which is implemented in Qt. 

load 'Project.rb'
load 'GUIMain.rb'
load 'Central.rb' 

projects = Array.new 
Central.instance 
app = Qt::Application.new(ARGV) 
gui = GUIMain.new 
gui.show
app.exec

