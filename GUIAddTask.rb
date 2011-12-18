#author::Simon Symeonidis 
# interface which allows you to add tasks 

require 'Qt4' 
load 'Configuration.rb'

class GUIAddTask < Qt::Dialog

public 
  # Default initializement for a qt dialog.
  def initialize(parent=nil) 
    super(parent) 
    # Labels 
  
    setStyleSheet Configuration.instance.styleSheet

    description_label = Qt::Label.new("Task Description") 
    askedby_label = Qt::Label.new("Asked by")
    estimatedtime_label = Qt::Label.new("Estimated Time")
    actualtime_label = Qt::Label.new("Actual Time") 
    datecreated_label = Qt::Label.new("Date Created")
    dependencies_label = Qt::Label.new("Dependencies")
    comments_label = Qt::Label.new("Comments")
    owners_label = Qt::Label.new("Owners")
    id_label = Qt::Label.new("ID")

    # Widgets
    desc = Qt::LineEdit.new() 
    askedby = Qt::ComboBox.new() 
    estimatedtime = Qt::LineEdit.new() 
    actualtime = Qt::LineEdit.new() 
    datecreated = Qt::LineEdit.new() 
    dependencies = Qt::ListWidget.new
    description = Qt::TextEdit.new() 
    comments = Qt::ListWidget.new(self)
    addowner_button = Qt::PushButton.new("Add Owner")
    @owners_combo = Qt::ComboBox.new self
    id = Qt::LineEdit.new() 
    ok = Qt::PushButton.new("Add") 
    cancel = Qt::PushButton.new("Cancel")

    # Layouts 
    vbox_layout = Qt::VBoxLayout.new() 
    elements_layout = Qt::GridLayout.new() 
    buttons_layout = Qt::GridLayout.new() 

    # Build the ui 
    elements_layout.addWidget(description_label,0,0) 
    elements_layout.addWidget(desc,0,1) 
    elements_layout.addWidget(estimatedtime_label,1,0) 
    elements_layout.addWidget(estimatedtime,1,1) 
    elements_layout.addWidget(actualtime_label,2,0) 
    elements_layout.addWidget(actualtime,2,1) 
    elements_layout.addWidget(datecreated_label,3,0) 
    elements_layout.addWidget(datecreated,3,1) 
    elements_layout.addWidget(dependencies_label,4,0) 
    elements_layout.addWidget(dependencies,4,1) 
    elements_layout.addWidget(comments_label,5,0) 
    elements_layout.addWidget(comments,5,1) 
    elements_layout.addWidget(id_label,6,0) 
    #elements_layout.addWidget(owners_label,
    elements_layout.addWidget(id,6,1) 

    buttons_layout.addWidget(ok,0,0) 
    buttons_layout.addWidget(cancel,0,1) 

    vbox_layout.addLayout(elements_layout)
    vbox_layout.addLayout(buttons_layout) 

    poppulateDummies

    setLayout(vbox_layout) 
  end 

private 
  def poppulateDummies
    @owners_combo.addItem "John" 
    @owners_combo.addItem "Frap" 
    @owners_combo.addItem "Nerq" 
    @owners_combo.addItem "Asfe" 
    @owners_combo.addItem "Pord" 
    
  end 
end 


