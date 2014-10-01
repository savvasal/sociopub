base_title = "SocioPub"


Given /^a user visits the 'Home Page'$/ do
  visit root_path
end

Then /^they should see the content 'SocioPub'$/ do
  expect(page).to have_content('SocioPub')
end

Then /^they should see the base title$/ do
  expect(page).to have_title("#{base_title}")
end

Then /^they should not see a custom page title$/ do
  expect(page).not_to have_title('| Home')
end


Then /^they should see the content 'Help'$/ do
  expect(page).to have_content('Help')
end

Given /^a user visits the 'Help Page'$/ do
  visit '/static_pages/help'
end

Given /^a new user created$/ do
  @user = User.new(name: "Example User", email: "user@example.com")
end

Then /^user should response to name$/ do
  expect(@user).to respond_to(:name)
end

And /^user should response to email$/ do
   expect(@user).to respond_to(:email)
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

Then /^it should not be valid$/ do
  expect(@user).not_to be_valid
end


