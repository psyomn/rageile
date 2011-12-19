#author::Simon Symeonidis 
# This is the GUI for managing tasks 

require 'Qt4'
load 'Configuration.rb'

class GUIManageProjects < Qt::Dialog
  # The window title of the GUI
  attr_reader :WindowTitle
public 
  def initialize(parent=nil)
    super()

    @WindowTitle = "Add Project!"

    setStyleSheet Configuration.instance.styleSheet 

    currentprojects_label = Qt::Label.new("Current Projects")
    numofprojects_label = Qt::Label.new("Number of Projects: " + 4.to_s) 
    addproject_button = Qt::PushButton.new("Add")
    removeproject_button = Qt::PushButton.new("Remove")
    cancel_button = Qt::PushButton.new("Cancel")
    project_list = Qt::ListWidget.new()

    #layouts 
    vbox = Qt::VBoxLayout.new() 
    grid = Qt::GridLayout.new() 

    grid.addWidget(numofprojects_label,0,0) 
    grid.addWidget(cancel_button,0,1) 
    grid.addWidget(removeproject_button,0,2) 
    grid.addWidget(addproject_button,0,3) 

    vbox.addWidget(currentprojects_label) 
    vbox.addWidget(project_list) 
    vbox.addLayout(grid) 

    setWindowTitle(@WindowTitle)
    setLayout(vbox) 

  end 
private 
end 


