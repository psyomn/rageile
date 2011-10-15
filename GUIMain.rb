#author::Simon Symeonidis 
# Main interface for the main window 

load 'Configuration.rb'
load 'GUIManageUsers.rb'
load 'GUIManageTasks.rb'
load 'GUIManageProjects.rb'

require 'Qt4'

class GUIMain < Qt::Widget  
  signals 'usersClicked()'
  signals 'tasksClicked()'
  signals 'projectsClicked()'
  slots 'userDialog()'
  slots 'taskDialog()'
  slots 'projectDialog()'

  def initialize(parent=nil) 
    super() 
    
    setWindowTitle("Rageile")

    p @CommonStylesheet
    setStyleSheet Configuration.instance.styleSheet 

    layout = Qt::VBoxLayout.new()
    main_label = Qt::Label.new("Manage Modules")
    main_logo = Qt::Pixmap.new "gfx/studios.jpg"
    gfx_label = Qt::Label.new "test"
    gfx_label.pixmap = gfx_label 

    @manage_users_button = Qt::PushButton.new(tr("Users"))
    @manage_tasks_button = Qt::PushButton.new(tr("Tasks")) 
    @manage_projects_button = Qt::PushButton.new(tr("Projects"))

    connect(@manage_users_button, SIGNAL('clicked()'), self, SLOT('userDialog()'))
    connect(@manage_tasks_button, SIGNAL('clicked()'), self, SLOT('taskDialog()'))
    connect(@manage_projects_button, SIGNAL('clicked()'), self, SLOT('projectDialog()'))

    layout.addWidget(main_label)
    layout.addWidget(@manage_users_button) 
    layout.addWidget(@manage_tasks_button) 
    layout.addWidget(@manage_projects_button) 
    setLayout(layout) 
    layout.addWidget(gfx_label)
    
    puts "Main window opened. "
  end 

private 
  
  # SLOTS!

  # Method to open up the user management dialog 
  def userDialog()
    manageuserui = GUIManageUsers.new(self) 
    manageuserui.show 
  end 

  # Method to open up the project management dialog
  def projectDialog()
    manageprojectui = GUIManageProjects.new(self)
    manageprojectui.show
  end

  # Method to open up the task management dialog 
  def taskDialog()
    managetaskui = GUIManageTasks.new(self)
    managetaskui.show
  end 

end 


