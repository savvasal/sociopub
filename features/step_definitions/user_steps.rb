Given /^a new user created$/ do
  @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar" )
end

Then /^user should response to name$/ do
  expect(@user).to respond_to(:name)
end

And /^user should response to email$/ do
   expect(@user).to respond_to(:email)
end    

And /^user should response to password digest$/ do
   expect(@user).to respond_to(:password_digest)
end 

And /^user should response to password$/ do
   expect(@user).to respond_to(:password)
end   
 
And /^user should response to password confirmation$/ do
   expect(@user).to respond_to(:password_confirmation)
end    

And /^user should response to authenticate$/ do
   expect(@user).to respond_to(:authenticate)
end    

And /^user should be valid$/ do
  expect(@user).to be_valid
end


Given /^a name is not present$/ do
  @user = User.new(name: " ", email: "user@example.com")
end


Given /^a name is too long$/ do
  @user = User.new(name: "a"*51, email: "user@example.com")
end


Given /^a user with name (.*) and email like that (.*)$/ do |testname, testemail|
  @user = User.new(name: testname , email: testemail)
end

Then /^user should not be valid$/ do
  expect(@user).not_to be_valid
end


Given /^an email address is already taken$/ do
  @user = User.new(name: "Example User", email: "user@example.com")
  user_with_same_email = @user.dup
  user_with_same_email.email = @user.email.upcase
  user_with_same_email.save
end


Given /^password is not present$/ do
  @user = User.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ")
end

Given /^password doesnt match confirmation$/ do
  @user = User.new(name: "Example User", email: "user@example.com",password: "111", password_confirmation: "222")
end

Given /^a password is too short$/ do
    @user = User.new(name: "Example User", email: "user@example.com",password: "a"*5, password_confirmation: "a"*5)
end

Given /^a user exist$/ do
  @user = User.new(name: "username", email: "user@example.com",password: "password", password_confirmation: "password")
  @user.save
end

And /^enter an invalid password$/ do
  found_user = User.find_by(name: "username")
  @invalid_user = found_user.authenticate("invalid")
end

Then /^password should not be valid$/ do
  expect(@invalid_user).to be_false
end
