#author::Simon Symeonidis 
# Interface for user management 

require 'Qt4'

class GUIManageUsers < Qt::Widget 

  attr_reader :Title 

public 

  # Standard initializement 
  def initialize(parent=nil) 
    super() 
    
    @Title = "Manage Users Dialog"
    setWindowTitle(@Title) 

    layout = Qt::VBoxLayout.new()
    grid_layout = Qt::GridLayout.new()

    add_button = Qt::PushButton.new("Add")
    rem_button = Qt::PushButton.new("Remove")
    ok_button = Qt::PushButton.new("Ok")
    cancel_button = Qt::PushButton.new("Cancel")

    grid_layout.addWidget(add_button,0,0) 
    grid_layout.addWidget(rem_button,0,1) 
    grid_layout.addWidget(ok_button,0,2) 
    grid_layout.addWidget(cancel_button,0,3)

    tree = Qt::TreeWidget.new()
    tree.setHeaderLabels(['Users']) 

    populateDummies(tree, "George", 10)
    populateDummies(tree, "Justin", 3) 
    populateDummies(tree, "Matt", 1) 

    layout.addWidget(tree) 
    layout.addLayout(grid_layout)
    setLayout(layout) 
  end 

private 

  # This is mainly here for testing 
  #   param is a tree obj
  def populateDummies(param, username, taskamount)
    item  = Qt::TreeWidgetItem.new() 
    item2 = Qt::TreeWidgetItem.new() 
    prog = Qt::ProgressBar.new()  

    item.setText(0, username) 
    item.setItemWidget(prog) 
    item2.setText(0, "Task 1") 

    item.setIcon(0, Qt::Icon.new("gfx/user.png"))
    param.addTopLevelItem(item) 

    taskamount.times { |it| 
      ito = Qt::TreeWidgetItem.new()
      ito.setText( 0, it.to_s + ". Task: You should do this and that" ) 
      
      if it == 2
        ito.setIcon(0, Qt::Icon.new("gfx/error.png")) 
      elsif it == 4 
        ito.setIcon(0, Qt::Icon.new("gfx/build.png")) 
      else
        ito.setIcon(0, Qt::Icon.new("gfx/task.png")) 
      end 
      item.insertChild(item.childCount, ito) 
    } 
  end 

end 

app = Qt::Application.new(ARGV) 

gui = GUIManageUsers.new() 

gui.show() 

app.exec()

