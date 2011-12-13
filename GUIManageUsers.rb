#author::Simon Symeonidis 
# Interface for user management 

require 'Qt4'
require_relative 'Configuration.rb'
require_relative 'GUIAddUser.rb'

class GUIManageUsers < Qt::Dialog
  slots 'manageUsersDialog()'
  slots 'removeUser()'

  attr_reader :Title 

public 

  # Standard initializement 
  def initialize(parent=nil) 
    super() 
    
    @Title = "Manage Users Dialog"
    setWindowTitle(@Title) 

    layout = Qt::VBoxLayout.new()
    grid_layout = Qt::GridLayout.new()

    @add_button = Qt::PushButton.new("Add")
    @rem_button = Qt::PushButton.new("Remove")
    @ok_button = Qt::PushButton.new("Ok")
    @cancel_button = Qt::PushButton.new("Cancel")
    
    connect(@add_button, SIGNAL('clicked()'), self, SLOT('manageUsersDialog()'))
    connect(@rem_button, SIGNAL('clicked()'), self, SLOT('removeUser()'))

    grid_layout.addWidget(@add_button,0,0) 
    grid_layout.addWidget(@rem_button,0,1) 
    grid_layout.addWidget(@ok_button,0,2) 
    grid_layout.addWidget(@cancel_button,0,3)

    @tree = Qt::TreeWidget.new()
    @tree.setHeaderLabels(['Users']) 

    populateDummies(@tree, "George", 10)
    populateDummies(@tree, "Justin", 3) 
    populateDummies(@tree, "Matt", 1) 

    layout.addWidget(@tree) 
    layout.addLayout(grid_layout)

    setStyleSheet Configuration.instance.styleSheet 
    setAttribute(Qt::WA_DeleteOnClose)
    setLayout(layout) 

  end 

private 

  # Remove user from the list 
  def removeUser()
    Qt::MessageBox.question(self, "Remove User", "Are you sure you want to remove user : " + @tree.selectedItems[0].text(0) + " ?")
  end 

  # This is mainly here for testing 
  #   param is a tree obj
  def populateDummies(param, username, taskamount)
    item  = Qt::TreeWidgetItem.new() 
    item2 = Qt::TreeWidgetItem.new() 
    prog = Qt::ProgressBar.new()  

    item.setText(0, username) 
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

  # Open the dialog to add a new user 
  def manageUsersDialog()
    addusergui = GUIAddUser.new(self) 
    addusergui.exec()
  end 

end 


