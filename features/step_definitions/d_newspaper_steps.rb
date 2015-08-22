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


Τότε(/^να εμφανίζονται μόνο (\d+) άρθρα$/) do |count|
  #νοουμένου ότι η συγκεκρυμένη πηγή έχει πάνω από 9 άρθρα
  expect(page).to have_css("article", count: count.to_i)
end
