base_title = "SocioPub"


Given /^a user visits the 'Home Page'$/ do
  visit '/static_pages/home'
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
