#author::Simon Symeonidis 
# Class for storage and manipulation of users  
# TODO make email unique

class User
  attr_accessor :Name # Name of the user
  attr_accessor :Surname # Surname of the user
  attr_accessor :Description #Description of the user 
  attr_accessor :Password #The password of the user
  attr_reader :Email # email of the user (this should probably be the unique thing)
  attr_reader :Nickname # A nickname should be thought of like a username

  attr_reader :ID # The unique identifier for a user

public

  # Default constructor 
  def initialize ( unique_nickname )
    raise "User with that nickname already exists" if @@NicknameList.include? unique_nickname
    @Email = String.new 
    @Name = String.new 
    @Surname = String.new
    @Nickname = unique_nickname 
    @@NicknameList.push unique_nickname
    @@EmailList = Array.new
    @ID = @@count 
    @@count += 1
  end 

  # Convert user info to string 
  def to_s
    "Nickname: " + @Nickname \
    + " Name: " + @Name.to_s \
    + " Surname: " + @Surname.to_s \
    + " Email: " + @Email.to_s \
    + " ID: " + @ID.to_s \
  end 

  def setNewNickname(newnick)
    if !@@NicknameList.include? newnick
      @@NicknameList.delete newnick 
      @Nickname = newnick 
      @@NicknameList.push @Nickname
    else
      raise "Another user is using that nickname."
    end 
  end 

  def setNewEmail(newemail)
    if !@@EmailList.include? @Email
      @@EmailList.delete @Email
      @Email = newemail
      @@EmailList.push @Email
    else
      raise "User with that email already exists."
    end 
  end

private
  @@count = 0
  @@NicknameList = Array.new
  @@EmailList = Array.new
end 

