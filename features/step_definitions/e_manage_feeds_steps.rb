Δεδομένου(/^ότι επισκέπτομαι την εφαρμογή ως Διαχειριστής$/) do
  alan = FactoryGirl.create(:ted)
  visit login_path
  fill_in('session_username', :with => "ted")
  fill_in('session_password', :with => "database")
  click_button("Είσοδος")
end



Τότε(/^εμφανίζεται υπερσύνδεσμος για επεξεργασία πηγής δίπλα από κάθε πηγή$/) do
  # Το πιο κάτω ενοείται
  # Ήταν καλύτερα να γίνεται με factory girl
  url = "http://www.paideia-news.com/rss/news.xml"
  fill_in('subscription_url', :with => url)
  click_button('Εγγραφή')
  page.should have_content("Επεξεργασία")
end

Όταν(/^ζητώ να επεξεργαστώ τη πηγή$/) do
  click_link("Επεξεργασία")
end

Όταν(/^αλλάζω το τίτλο$/) do
  fill_in('feed_title', :with => "NewTitle")  
end

Όταν(/^ζητώ να αποθηκευτούν οι αλλαγές$/) do
  click_button("Αποθήκευση")
end

Δεδομένου(/^ζητώ να διαχειριστώ τις συνδρομές μου$/) do
  visit subscriptions_path
end

Όταν(/^επισυμαίνω τη ροή ως συμμβατή$/) do
  check('Συμβατή')
end
