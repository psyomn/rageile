require 'Qt4'

require_relative 'Configuration.rb'
require_relative 'GUIManageUsers.rb'
require_relative 'GUIManageTasks.rb'


#author::Simon Symeonidis 
# This opens up the main dialog. From the 
# main dialog the user is able to open any other
# required dialog from there
class GUIMain < Qt::Dialog
  signals 'usersClicked()'
  signals 'tasksClicked()'
  signals 'projectsClicked()'
  slots 'userDialog()'
  slots 'taskDialog()'
  slots 'projectDialog()'

  # Main initializement of qt gui
  def initialize(parent=nil) 
    super() 
    
    setWindowTitle("Rageile")

    setStyleSheet Configuration.instance.styleSheet 

    layout = Qt::VBoxLayout.new()
    main_label = Qt::Label.new("Manage Modules")
    main_logo = Qt::Pixmap.new "gfx/studios.jpg"
    transparent = Qt::Image.new()
    graphics_scene = Qt::GraphicsScene.new 
    graphics_view = Qt::GraphicsView.new graphics_scene
    gfx_label = Qt::Label.new

    gfx_label.setAttribute(Qt::WA_TranslucentBackground)
    gfx_label.pixmap = main_logo

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
    layout.addWidget(gfx_label)
    setLayout(layout) 
    
    # puts "Main window opened. "
  end 

private 
  
  # SLOTS!

  # Method to open up the user management dialog 
  def userDialog()
    manageuserui = GUIManageUsers.new(self) 
    manageuserui.exec()
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


