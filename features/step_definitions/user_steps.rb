Given /^there is a User$/ do
  FactoryGirl.create(:user)
end

Given(/^the User has posted the message "([^"]*)"$/) do |message_text|
  User.count.should == 1
  FactoryGirl.create(:micropost, :content => message_text, :user => User.first)
end

When(/^I visit the page for the Micropost$/) do
  User.count.should == 1
  visit(micropost_path(Micropost.first))
end

Then(/^I should see "([^"]*)"$/) do |text|
  page.should have_content(text)
end
