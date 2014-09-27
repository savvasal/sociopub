Given /^a user visits the 'Home Page'$/ do
  visit '/static_pages/home'
end

Then /^they should see the content 'SocioPub'$/ do
  expect(page).to have_content('SocioPub')
end

Then /^they should see the content 'Help'$/ do
  expect(page).to have_content('Help')
end

Given /^a user visits the 'Help Page'$/ do
  visit '/static_pages/help'
end
