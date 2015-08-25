Δεδομένου(/^ότι εισέρχομαι στην εφαρμογή ως Χρήστης$/) do
  @alan = FactoryGirl.create(:alan)
  visit login_path
  fill_in('session_username', :with => "alan")
  fill_in('session_password', :with => "enigma")
  click_button("Είσοδος")
end

Δεδομένου(/^ζητώ να επεξεργαστώ τις συνδρομές μου$/) do
  visit subscriptions_path
end

Δεδομένου(/^δεν είμαι εγγεγραμένος στη ροή The Guardian$/) do
  @guardian = FactoryGirl.create(:theguardian)
end

Δεδομένου(/^είμαι εγγεγραμένος στη ροή Wired$/) do
  @wired = FactoryGirl.create(:wired)
  @subscription = FactoryGirl.create(:subscribe_user_to_feed, :user_id => @alan.id, :feed_id => @wired.id)  
end

Όταν(/^ζητώ να εγγραφώ στη ροή The Guardian$/) do
  page.find('li', :text => 'The Guardian').click_link("Εγγραφή")
end

Τότε(/^να εμφανίζεται η επιλογή διαγραφής για τη ροή The Guardian$/) do
  page.find('li', :text => 'The Guardian').should have_content("Διαγραφή")
end

Όταν(/^επιλέγω να ακυρώσω την εγγραφή μου στη ροή Wired$/) do
  page.find('li', :text => 'Wired').click_link("Διαγραφή")
end

# Δεν αρκεί για τον έλεγχο
Τότε(/^να εμφανίζεται η επιλογή εγγραφής στη ροή Wired$/) do
  page.find('li', :text => 'Wired').should have_content("Εγγραφή")
end

# σαν λεκτικό πρέπει να αλλάξει - πολύ γενικό 
Όταν(/^δίνω τον (.*)$/) do |url|
  fill_in('subscription_url', :with => url)
end

Τότε(/^να προστίθεται στις συνδρομές μου$/) do
  Feed.count.should == 3
end

Τότε(/^να μην προστίθεται στις συνδρομές μου$/) do
  Feed.count.should == 2
end

Όταν(/^ζητώ να προστεθεί στις συνδρομές μου$/) do
  click_button("Εγγραφή")
end
