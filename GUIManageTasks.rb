#author::Simon Symeonidis
# The gui to manage a collection of tasks. 

require 'Qt4'
load 'Configuration.rb'
load 'GUIAddTask.rb'

class GUIManageTasks < Qt::Widget
  slots 'assignTask()'
  slots 'removeTask()'
public 
  def initialize(parent=nil) 
    super()
    setStyleSheet Configuration.instance.styleSheet 

    setWindowTitle("Manage Tasks")
    @tasklabel = Qt::Label.new("Table of Tasks")
    @table = Qt::TableWidget.new(1,7,self) 
    @layout = Qt::VBoxLayout.new() 
    @button_grid = Qt::GridLayout.new() 
    @assign_button = Qt::PushButton.new("Assign") 
    @remove_button = Qt::PushButton.new("Remove")

    connect(@assign_button, SIGNAL('clicked()'), self, SLOT('assignTask()'))
    connect(@remove_button, SIGNAL('clicked()'), self, SLOT('removeTask()'))

    @button_grid.addWidget(@assign_button,0,0)
    @button_grid.addWidget(@remove_button,0,1)

    @layout.addWidget(@tasklabel) 
    @layout.addWidget(@table)
    @layout.addLayout(@button_grid) 
    setLayout(@layout)
  end 
private 
  # Assign a task to someone. 
  def assignTask()
    addtaskgui = GUIAddTask.new 
    addtaskgui.show
  end

  def removeTask()
  end
  
end 
