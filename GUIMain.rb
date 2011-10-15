#author::Simon Symeonidis 
# Main interface for the main window 

load 'Configuration.rb'

require 'Qt4'

class GUIMain < Qt::Widget  

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

    manage_users_button = Qt::PushButton.new(tr("Users"))
    manage_tasks_button = Qt::PushButton.new(tr("Tasks")) 
    manage_projects_button = Qt::PushButton.new(tr("Projects"))

    layout.addWidget(main_label)
    layout.addWidget(manage_users_button) 
    layout.addWidget(manage_tasks_button) 
    layout.addWidget(manage_projects_button) 
    setLayout(layout) 
    layout.addWidget(gfx_label)
    
    puts "Main window opened. "
  end 

end 


