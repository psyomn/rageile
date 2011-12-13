#author::Simon Symeonidis 
# Class to handle the creation, addition of a new user 

require 'Qt4'
load 'Configuration.rb'

class GUIAddUser < Qt::Dialog
  slots 'ok()'
  slots 'cancel()'

  attr :Title 

public 

  # Default constructor 
  def initialize(parent=nil) 
    super() 

    @Title = "Add User"
    setWindowTitle(@Title)

    setStyleSheet Configuration.instance.styleSheet

    label_name = Qt::Label.new("Name")
    label_surname = Qt::Label.new("Surname")
    label_nickname = Qt::Label.new("Nickname")
    label_email = Qt::Label.new("E-mail")
    label_description = Qt::Label.new("Description")
    @multiedit_description = Qt::TextEdit.new()
    @edit_name = Qt::LineEdit.new() 
    @edit_surname = Qt::LineEdit.new()   
    @edit_nickname = Qt::LineEdit.new() 
    @edit_email = Qt::LineEdit.new() 
    layout = Qt::GridLayout.new() 
    button_layout = Qt::GridLayout.new() 
    vbox_layout = Qt::VBoxLayout.new() 
    @ok_button = Qt::PushButton.new("OK") 
    @cancel_button = Qt::PushButton.new("Cancel")
    statusbar = Qt::StatusBar.new()
    
    connect(@ok_button, SIGNAL('clicked()'), self, SLOT("ok()"))
    connect(@cancel_button, SIGNAL('clicked()'), self, SLOT("cancel()"))

    layout.addWidget(label_name,0,0) 
    layout.addWidget(@edit_name,0,1) 
    layout.addWidget(label_surname,1,0) 
    layout.addWidget(@edit_surname,1,1) 
    layout.addWidget(label_nickname,2,0) 
    layout.addWidget(@edit_nickname,2,1) 
    layout.addWidget(label_email,3,0)
    layout.addWidget(@edit_email,3,1) 
    layout.addWidget(label_description,4,0) 
    layout.addWidget(@multiedit_description,4,1) 

    button_layout.addWidget(@ok_button,0,0) 
    button_layout.addWidget(@cancel_button,0,1) 
    
    vbox_layout.addLayout(layout)
    vbox_layout.addLayout(button_layout) 

    statusbar.showMessage("ID: " + 1.to_s) 
    vbox_layout.addWidget(statusbar)

    setLayout(vbox_layout) 
  end 

private
  
  # This confirms entered information 
  # and adds the item to the user list 
  def ok()
    name = String.new 
    surname = String.new 
    nickname = String.new 
    email = String.new 
    description = String.new 

    name = @edit_name.text
    surname = @edit_surname.text 
    nickname = @edit_nickname.text 
    email = @edit_email.text 
    description = @multiedit_description.toPlainText 

    if Configuration.instance.Attributes["DEBUG"] == "true"
      puts "Add user: "
      puts "\t" + name 
      puts "\t" + surname 
      puts "\t" + nickname 
      puts "\t" + email 
      puts "\t" + description
    end 

    accept()
  end 

  # If the user chooses to cancel
  def cancel() 
    reject()
  end 
end 

