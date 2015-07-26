Δεδομένου(/^ότι εισέρχομαι στην εφαρμογή ως επισκέπτης$/) do
  # pending("Θα ελέγχει αν είναι logout");
  # Χρειάζεται ανανέωση
  visit root_path
end

Δεδομένου(/^πηγαίνω να κάνω εγγραφή$/) do
  visit '/signup'
end

Δεδομένου(/^μου εμφανίζεται η φόρμα εγγραφής$/) do
  page.should have_field('user_email')
  page.should have_field('user_name')
  page.should have_field('user_password')
  page.should have_field('user_password_confirmation')
end


Όταν(/^το (\w+) είναι έγκυρο$/) do |name|
  fill_in('user_name',{:with => name })
end

Όταν(/^η (.*) είναι έγκυρη$/) do |email|
  fill_in('user_email',{:with => email })
end

Όταν(/^ο (.*) που έχω καταχωρήσει είναι έγκυρος$/) do |password|
  fill_in('user_password',{:with => password })
  fill_in('user_password_confirmation',{:with => password })

end

Όταν(/^αιτούμαι να εγγραφώ στο σύστημα$/) do
  click_button('Εγγραφή')
end

Τότε(/^να εμφανίζεται μήνυμα ότι έχω εγγραφεί με επιτυχία$/) do
  page.should have_content('Η εγγραφή πραγματοποιήθηκε με επιτυχία')
end

Τότε(/^να εμφανίζεται το προφίλ μου$/) do
  page.should have_content('Προφίλ')
end

Όταν(/^η (.*) δεν έχει τη σωστή μορφή$/) do |email|
    fill_in('user_name',{:with => "user" })
    fill_in('user_email',{:with => email })
    fill_in('user_password',{:with => "password" })
    click_button('Εγγραφή')
end

Τότε(/^να εμφανίζ(εται|ει) μήνυμα λάθους$/) do
  page.should have_content('Λάθος')
end

Όταν(/^το όνομα χρήστη είναι πολύ μεγάλο$/) do
  name = "a" * 128
  fill_in('user_name',{:with => name })
  fill_in('user_email',{:with => "user@foo.com" })
  fill_in('user_password',{:with => "password" })
  click_button('Εγγραφή')
end

Όταν(/^το όνομα χρήστη είναι δεσμευμένο$/) do
  FactoryGirl.create(:user)
  fill_in('user_name',{:with => "duplicate_username" })
  fill_in('user_email',{:with => "user@foo.com" })
  fill_in('user_password',{:with => "password" })
  click_button('Εγγραφή')
end

Τότε(/^να εμφανίζει μήνυμα ότι το όνομα υπάρχει$/) do
  page.should have_content('Επέλεξε')
end


Όταν(/^η διεύθυνση ηλεκτρονικού ταχυδρομείου υπάρχει$/) do
  FactoryGirl.create(:user)
  fill_in('user_name',{:with => "name" })
  fill_in('user_email',{:with => "duplicate@email.com" })
  fill_in('user_password',{:with => "password" })
  click_button('Εγγραφή')
end

Τότε(/^να εμφανίζει μήνυμα λάθους ότι η διεύθυνση υπάρχει$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Τότε(/^να προτείνεται χρησιμοποιήθει η Λειτουργία υπενθύμησης κωδικού$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Όταν(/^ο κωδικός είναι κάτω από (\d+) χαρακτήρες$/) do |arg1|
  fill_in('user_name',{:with => "myname" })
  fill_in('user_email',{:with => "example@email.com" })
  fill_in('user_password',{:with => "123" })
  click_button('Εγγραφή')
end

Τότε(/^να εμφανίζει μήνυμα ότι χρειάζεται μεγαλύτερος κωδικός$/) do
  page.should have_content("Ο κωδικός")
end

Τότε(/^να ζητά καινούργιο κωδικό$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
