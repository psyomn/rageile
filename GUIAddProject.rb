#author::Simon Symeonidis 
# The gui for adding projects. 

load 'Configuration.rb'
require 'Qt4'

class GUIAddProject < Qt::Widget

public
  # standard initialization for the gui 
  #   param openmethod is to reuse this interface
  #   if we simply need to edit a project description
  def initialize(parent=nil, openmethod=nil) 
    super(parent)
    setStyleSheet Configuration.instance.styleSheet
    
    #Widgets 
    tasklist_label = Qt::Label.new("List of Tasks")
    startdate_label = Qt::Label.new("Start Date")
    enddate_label = Qt::Label.new("End Date")
    owners_label = Qt::Label.new("Owners")
    line = Qt::Line.new()
    tasklist = Qt::ListWidget.new() 
    startdate = Qt::LineEdit.new() 
    enddate = Qt::LineEdit.new() 
    projectowners = Qt::ListWidget.new() 
    addowner_button = Qt::PushButton.new("Add &Owners")
    ok_button = Qt::PushButton.new("Ok")
    cancel_button = Qt::PushButton.new("Cancel")

    #Views
    vbox = Qt::VBoxLayout.new() 
    grid = Qt::GridLayout.new() 
    buttongrid = Qt::GridLayout.new() 

    vbox.addWidget(tasklist_label)
    vbox.addWidget(tasklist) 
    
    grid.addWidget(startdate_label,0,0)
    grid.addWidget(enddate_label,0,1) 
    grid.addWidget(startdate,1,0) 
    grid.addWidget(enddate,1,1) 
    
    vbox.addLayout(grid) 
    vbox.addWidget(owners_label)
    vbox.addWidget(projectowners)
    vbox.addWidget(addowner_button)

    buttongrid.addWidget(ok_button,0,0) 
    buttongrid.addWidget(cancel_button,0,1)
    
    vbox.addLayout(buttongrid)

    setLayout(vbox) 
  end 
private

end 

app = Qt::Application.new(ARGV) 
gui = GUIAddProject.new() 
gui.show() 
app.exec()

