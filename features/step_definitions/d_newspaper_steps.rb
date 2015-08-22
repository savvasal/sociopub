# μπορεί να μπει μόνο μια συνάρτηση για το επισκέπτομαι την εφαρμογή ως
Δεδομένου(/^ότι επισκέπτομαι την εφαρμογή ως Χρήστης$/) do
  alan = FactoryGirl.create(:alan)
  visit login_path
  fill_in('session_username', :with => "alan")
  fill_in('session_password', :with => "enigma")
  click_button("Είσοδος")
 
end

Όταν(/^ζητήσω να διαβάσω εφημερίδα$/) do
  visit newspaper_path
end

Τότε(/^δίπλα από κάθε άρθρο να εμφανίζεται η πηγή$/) do
  # Σίγουρα κάτι καλύτερο
  page.should have_content("guardian")
end
