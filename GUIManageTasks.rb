#author::Simon Symeonidis
# The gui to manage a collection of tasks. 

require 'Qt4'

class GUIManageTasks < Qt::Widget

public 
  def initialize(parent=nil) 
    super()
    setWindowTitle("Manage Tasks")
    temp = Qt::Label.new("TODO")
    layout = Qt::VBoxLayout.new() 
    layout.addWidget(temp) 
    setLayout(layout)
  end 
private 

end 
