#author::Simon Symeonidis 
# Class for storage and manipulation of users  
# TODO make email unique

class User

  attr_accessor :Email # email of the user (this should probably be the unique thing)
  attr_accessor :Password #The password of the user
  attr_accessor :Name # Name of the user
  attr_accessor :Surname # Surname of the user
  attr_accessor :Description #Description of the user 
  attr_reader :Nickname # would be good if it were unique

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

  private
  @@count = 0
  @@NicknameList = Array.new
  @@EmailList = Array.new
end 

