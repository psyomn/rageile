#author::Simon Symeonidis 
# Class for storage and manipulation of users  

class User

  attr_accessor :Email
  attr_accessor :Name
  attr_accessor :Surname 
  attr_reader :Nickname # would be good if it were unique
  attr_reader :ID 

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
    "Name: " + @Name.to_s \
    + "\nSurname: " + @Surname.to_s \
    + "\nEmail: " + @Email.to_s \
    + "\nID: " + @ID.to_s 
  end 

private 
  @@count = 0
  @@NicknameList = Array.new 
end 

