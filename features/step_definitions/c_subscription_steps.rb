Δεδομένου(/^ότι εισέρχομαι στην εφαρμογή ως Χρήστης$/) do
  alan = FactoryGirl.create(:alan)
  visit login_path
  fill_in('session_username', :with => "alan")
  fill_in('session_password', :with => "enigma")
  click_button("Είσοδος")
end

Δεδομένου(/^ζητώ να διαχειριστώ τις συνδρομές μου$/) do
  visit subscriptions_path
end

Δεδομένου(/^είμαι εγγεγραμένος στη ροή (.*) με υπερσύνδεσμο (.*)$/) do |title, url|
  fill_in('subscription_url', :with => url)
  click_button('Εγγραφή')
end

Δεδομένου(/^δεν είμαι εγγεγραμένος στη ροή (.*) με υπερσύνδεσμο (.*)$/) do |title, url|
  fill_in('subscription_url', :with => url)
  click_button('Εγγραφή')
  click_link('Διαγραφή')
end

Όταν(/^δίνω τον (.*)$/) do |url|
  fill_in('subscription_url', :with => url)
end

# Παράξενο δαμέ γιατί πάντα φκάλει ότι είναι 3 εφόσον αλλάζουν
Τότε(/^να προστίθεται στις συνδρομές μου$/) do
  Feed.count.should == 3
end

Όταν(/^ζητώ να προστεθεί στις συνδρομές μου$/) do
  click_button("Εγγραφή")
end
