When(/^I visit application$/) do
  visit root_path
end

Then(/^I should see link to "([^"]*)" Page$/) do |hyperlink|
  page.should have_link(hyperlink)
  # expect(page).to have_content(hyperlink)
end

When(/^I click the link to "([^"]*)"$/) do |page|
  click_link(page)
end

Then(/^I should see "([^"]*)" Page$/) do |arg1|
  expect(page).to have_content(arg1)
  #  response.should eq 200
end

Then(/^I should see "([^"]*)" on title$/) do |title|
  expect(page).to have_title title
end
