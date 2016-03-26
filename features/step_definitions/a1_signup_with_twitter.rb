Δεδομένου(/^εμφανίζεται το εικονίδιο για εγγραφή μέσω twitter$/) do
  page.should have_xpath("//img[@alt=\"twitter icon\"]")
end

Όταν(/^συνδέομαι μέσω του λογαριασμού μου στο twitter$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Τότε(/^να εγγράφομαι στην εφαρμογή$/) do
  User.count.should == 1
end
