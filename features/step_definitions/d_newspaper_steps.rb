Δεδομένου(/^είμαι εγγεγραμένος στη ροή The Guardian$/) do
  @guardian_rss = FactoryGirl.create(:theguardian)
  @subscription = FactoryGirl.create(:subscribe_user_to_feed, :user_id => @alan.id, :feed_id => @guardian_rss.id)
end

Δεδομένου(/^η σελίδα theguardian\.co\.uk είναι συμβατή$/) do
  FactoryGirl.create(:website, :url => 'http://theguardian.com/', :compatible => true )
end

Δεδομένου(/^είμαι εγγεγραμένος στη ροή Philenews$/) do
  @philenews = FactoryGirl.create(:philenews)
end

Δεδομένου(/^η σελίδα philenews\.com δεν είναι συμβατή$/) do
  FactoryGirl.create(:website, :url => 'http://philenews.com/' , :compatible => false)
end

Όταν(/^ζητήσω να διαβάσω εφημερίδα$/) do
  @before_visit_newspaper = Time.now.to_f * 1000
  visit newspaper_path
end



Τότε(/^εμφανίζονται μόνο (\d+) άρθρα$/) do |count|
  #νοουμένου ότι η συγκεκριμένη πηγή έχει πάνω από 9 άρθρα
  expect(page).to have_css("article", count: count.to_i)
end

Τότε(/^σε λιγότερο από (\d+) δευτερόλεπτο εμφανίζεται περιεχόμενο$/) do |sec|
  sec = sec.to_f
  @after_visit_newspaper = Time.now.to_f * 1000
  response_time = @after_visit_newspaper - @before_visit_newspaper
  expect(response_time).to be < (sec*1000),
                           "Άργησε πολύ. Ήταν #{response_time/1000.0} δευτερόλεπτα"
end

# όχι καλός έλεγχος 
Τότε(/^εμφανίζονται άρθρα από theguardian\.co\.uk$/) do
  page.should have_content("theguardian.co.uk")
end

Τότε(/^δεν εμφανίζονται άρθρα από philenews\.com$/) do
  page.should_not have_content("philenews.com")
end
