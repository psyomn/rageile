#author::Simon Symeonidis 
# Class for storage and manipulation of users  
class User
  # Name of the user
  attr_accessor :Name
  # Surname of the user
  attr_accessor :Surname 
  # Description of the user 
  attr_accessor :Description 
  # The password of the user
  attr_accessor :Password 
  # email of the user 
  attr_reader :Email 
  # A nickname should be thought of like a username
  attr_reader :Nickname 
  # The unique identifier for a user
  attr_reader :ID 

public

  # Default constructor. Must be constructed with 
  # a unique nickname given. The unique nickname is 
  # a string. 
  def initialize(unique_nickname)
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
  # This can be used for debug purposes or
  # the CLI interface.
  def to_s
    "Nickname: " + @Nickname \
    + " Name: " + @Name.to_s \
    + " Surname: " + @Surname.to_s \
    + " Email: " + @Email.to_s \
    + " ID: " + @ID.to_s \
  end 

  # When a user is edited, we set this new value. 
  # we also add this value to a shared array among
  # these instances in order to check in the future
  # if the next instance having its nickname changed
  # is clashing with another instance
  def setNewNickname(newnick)
    if !@@NicknameList.include? newnick
      @@NicknameList.delete newnick 
      @Nickname = newnick 
      @@NicknameList.push @Nickname
    else
      raise "Another user is using that nickname."
    end 
  end 

  # When a user is edited, we set this new value. 
  # we also add this value to a shared array among
  # these instances in order to check in the future
  # if the next instance having its email changed
  # is clashing with another instance
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

