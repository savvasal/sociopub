Δεδομένου(/^ότι επίσκεπτομαι την εφαρμογή ως Eπισκέπτης$/) do
  visit root_path
  # κάπως να παίρνει τη παράμετρο Επισκέπτης και να περιμένει να δει Είσοδο
  # έτσι θα μπορεί να εφαρμοστεί και στη φράση ως Χρήστης
  # το ότι ελέγχει αν έχει το κουμπί Είσοδος είναι αξιόπιστο;
  # θα ήταν καλύτερα να έλεγχε το current_user; πόσο καλό είναι να ελέγχω με μέθοδο της εφαρμογής
  page.should have_content("Είσοδος")
end

Δεδομένου(/^ζητώ να εγγραφώ$/) do
  visit signup_path
end

Δεδομένου(/^εμφανίζεται η φόρμα εγγραφής$/) do
  # Τα πεδία της φόρμας υποτίθεται πως θα πρέπει να ορίζονται σε ένα διαφορετικό σενάριο και να επιλέγονται από εκεί
  # τι γίνεται όταν αλλάζουν τα πεδία; θα πρέπει να αλλάξουν όλα τα σενάρια;
  # τι γίνεται όταν αλλάζει το όνομα κάποιου label- πεδίο π.χ. Όνομα Χρήστη σε Ψευδώνυμο
  # προσπάθεια εφαρμογής DRY
  page.should have_content("Ψευδώνυμο")
  page.should have_content("Η-Διεύθυνση")
  page.should have_content("Κωδικός")
  page.should have_content("Επανάληψη Κωδικού")
  page.should have_button("Εγγραφή")
end

 # πολύ γενικές προτάσεις που μπορεί να ξαναβρεθούν και να υπάρξει πρόβλημα
Όταν(/^δίνω έγκυρο (.*)$/) do |username|
  fill_in('user_username', :with => username)
end

# Συντακτικά της <η-διεύθυνση> δεν είναι σωστο - αν μπορεί να αλλαχτεί
Όταν(/^έγκυρη (.*)$/) do |email|
  fill_in('user_email', :with => email)  
end

Όταν(/^καταχωρώ 2 φορές έγκυρο (.*)$/) do |password|
  fill_in('user_password', :with => password)
  fill_in('user_password_confirmation', :with => password)
end

Όταν(/^αιτούμαι να εγγραφώ$/) do
  click_button('Εγγραφή')
end


Τότε(/^να εγγράφομαι από την εφαρμογή$/) do
  User.count.should == 1
end


# Λείπει το βήμα για επαλήθευση η-ταχυδρομείου 
Τότε(/^να μου αποστέλλεται η\-ταχυδρομείο για επαλήθευση της (.*)$/) do |email_address|
  open_email(email_address)
  current_email.subject.should have_content("[sociopub] Ενεργοποίηση Λογαριασμού")
  # Δεν ελέγχει το body
  # current_email.body.should =~ Regexp.new("Activation")
end

Όταν(/^συμπληρώνω τη φόρμα εγγραφής$/) do
  fill_in('user_username', :with => "username")
  fill_in('user_email', :with => "example@sociopub.com")  
  fill_in('user_password', :with => "password")
  fill_in('user_password_confirmation', :with => "password")
end

Όταν(/^η (.*) δεν είναι έγκυρη$/) do |email_address|
  fill_in('user_email', :with => email_address)  
end

Όταν(/^το όνομα χρήστη είναι πάνω από (\d+) χαρακτήρες$/) do |username_limit|
  username_limit = username_limit.to_i
  username = "a" * (username_limit + 1)
  fill_in('user_username', :with => username)  
end

Όταν(/^το ψευδώνυμο είναι δεσμευμένο$/) do
  ada = FactoryGirl.create(:ada)
  fill_in('user_username', :with => "ada")
end

Όταν(/^η η\-διεύθυνση είναι δεσμευμένη$/) do
  ada = FactoryGirl.create(:ada)
  fill_in('user_email', :with => "ada@sociopub.com")
end

Όταν(/^ο κωδικός είναι κάτω από (\d+) χαρακτήρες$/) do |password_min|
  password = "a" * (password_min.to_i - 1)
  fill_in('user_password', :with => password)
  fill_in('user_password_confirmation', :with => password)
end

Όταν(/^το ψευδώνυμο περιέχει μη\-αλφαριθμητικούς χαρακτήρες$/) do
  fill_in('user_username', :with => "alan!")
end

Τότε(/^να εμφανίζεται μήνυμα ότι (.*)/) do |message|
  page.should have_content(message)
end

