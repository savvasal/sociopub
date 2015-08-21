Δεδομένου(/^ότι επισκέπτομαι την εφαρμογή ως Διαχειριστής$/) do
  alan = FactoryGirl.create(:alan)
  visit login_path
  fill_in('session_username', :with => "ted")
  fill_in('session_password', :with => "database")
  click_button("Είσοδος")
end


Τότε(/^εμφανίζεται υπερσύνδεσμος για επεξεργασία πηγής$/) do
  page.should have_content("Επεξεργασία")
end

Όταν(/^ζητώ να επεξεργαστώ τη πηγή$/) do
  click_link("Επεξεργασία")
end

Όταν(/^αλλάζω το τίτλο$/) do
  fill_in('feed_title', :with => NewTitle)  
end

Όταν(/^ζητώ να αποθηκευτούν οι αλλαγές$/) do
  click_button("Αποθήκευση")
end
