Δεδομένου(/^εμφανίζεται το εικονίδιο για εγγραφή μέσω twitter$/) do
  page.should have_xpath("//img[@alt=\"twitter icon\"]")
end

Όταν(/^ζητώ να να συνδεθώ μέσω του λογαριασμού μου στο twitter$/) do
  visit oauth_callback_path
end

Όταν(/^το twitter με αναγνωρίζει$/) do
  visit oauth_callback_path
end

Τότε(/^να εμφανίζεται ότι είμαι συνδεδεμένος$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
