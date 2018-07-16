class SnapUser
  attr_accessor :username, :password, :email
  @@all_users = []
  def initialize(user_name, pass_word, e_mail)
    @username = user_name
    @password = pass_word
    @email = e_mail
    @@all_users.push(@username)
   # snaps = Array.new
  end
  def self.show_users
    @@all_users
  end
  def send_snap(user)
    if @@all_users.include? user
      puts "You successfully sent a snap to #{user}"
    else
      puts "i'm sorry, that user doesn't exist"
    end
  end
end

# sofia_snap = SnapUser.new("so.fifi", "123cats", "s@s.s")
# jess_snap = SnapUser.new("jess", "123cats", "s@s.s")

# jess_snap.send_snap("so.fifi")
# puts SnapUser.show_users
create_account = true
send_snaps = false

while create_account == true
  puts "Welcome to snap! Let's make you a user. What is your username?"
  user_input = gets.chomp
  puts "What's the pword"
  pword_input = gets.chomp
  puts "what's the email"
  email_input = gets.chomp
  snap_user = SnapUser.new(user_input, pword_input, email_input)
  puts "hi #{snap_user.username}, welcome to snapchat!"
  puts "Would you like to make another account?"
  answer = gets.chomp 
  if answer.upcase == "yes"
    create_account = true
    elsif answer.upcase == "no"
    create_account = false
    send_snaps = true
    break
  end
end

while send_snaps == true
  if @@all_users.length > 1
    puts "who would you like to send a snap to?"
    answer = gets.chomp
    snap_user.send_snaps(answer)
  else
    puts "You can't do that unless you have two users, silly! Would you like to make another user?"
    responses = gets.chomp
    if responses.upcase == "yes"
      send_snaps = false
      create_account = true
    elsif responses.upcase == "no"
      puts "um bye..."
      break
    end
  end
end

