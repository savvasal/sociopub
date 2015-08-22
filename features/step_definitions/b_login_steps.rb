Δεδομένου(/^ότι επίσκεπτομαι την εφαρμογή ως Eπισκέπτης$/) do
  visit root_path
  page.should have_content("Είσοδος")
  # αν είναι συνδεδεμένος να κάνει logout
end

Δεδομένου(/^ζητώ να εισέλθω στην εφαρμογή$/) do
  visit login_path
end

Δεδομένου(/^μου εμφανίζεται η φόρμα για είσοδο στην εφαρμογή$/) do
  page.should have_content("Ψευδώνυμο")
  page.should have_content("Κωδικός")
  page.should have_button("Είσοδος")
end

Δεδομένου(/^έχω λογαριασμό με όνομα χρήστη "([^"]*)" και κωδικό "([^"]*)"$/) do |username, password|
  alan = FactoryGirl.create(:alan)
end

Όταν(/^(?:δώσω|δίνω) το ψευδώνυμο "([^"]*)" και τον κωδικό "([^"]*)"$/) do |username, password|
  fill_in('session_username', :with => username)
  fill_in('session_password', :with => password)
end

Όταν(/^ζητήσω να συνδεθώ$/) do
  click_button("Είσοδος")
end


Τότε(/^να εισέρχομαι στην εφαρμογή ως "([^"]*)"$/) do |username|
  page.should have_content("Έξοδος")
  page.should have_content(username)
end

Όταν(/^διαλέξω την επιλογή μη με ξεχάσεις$/) do
  check('session_remember_me')  
end

Τότε(/^μετά από επανεκκίνηση του φυλλομετρητή να παραμείνω συνδεδεμένος ως (.*)$/) do |username|
  expire_cookies
  visit root_path
  page.should have_content("Λογαριασμός")
  page.should have_content("Έξοδος")
 # page.should have_content(username)
end
