# -*- coding: utf-8 -*-
#language: el

Δεδομένου /^ότι δημιουργήθηκε ένας νεός χρήστης$/ do
  @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar" )
end

Then /^πρέπει να έχει καταχωρήσει όνομα χρήστη$/ do
  expect(@user).to respond_to(:name)
end

And /^να έχει καταχωρήσει email$/ do
   expect(@user).to respond_to(:email)
end    

And /^να έχει καταχωρήσει κωδικό 2 φορές$/ do
   expect(@user).to respond_to(:password_digest)
   expect(@user).to respond_to(:password)
   expect(@user).to respond_to(:password_confirmation)
end 


And /^να είναι έγκυρος$/ do
  expect(@user).to be_valid
end


Given /^δεν έχει καταχωρηθεί κάποιο όνομα$/ do
  @user = User.new(name: " ", email: "user@example.com")
end


Given /^ότι το όνομα χρήστη είναι πολύ μεγάλο$/ do
  @user = User.new(name: "a"*51, email: "user@example.com")
end


Given /^ένα χρήστης με όνομα (.*)και email (.*)$/ do |testname, testemail|
  @user = User.new(name: testname , email: testemail)
end

Then /^ο χρήστης δεν πρέπει να είναι έγκυρος$/ do
  expect(@user).not_to be_valid
end


