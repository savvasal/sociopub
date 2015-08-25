Δεδομένου(/^ζητώ να διαχειριστώ τις σελίδες που προέρχεται το περιεχόμενο των ροών$/) do
  visit websites_path
end

Δεδομένου(/^η ιστοσελίδα politis\-news\.com είναι μη συμβατή$/) do
  FactoryGirl.create(:website, :url => 'http://politis-news.com/', :compatible => false)
end

Όταν(/^επισημαίνω politis\-news\.com τη σελίδα ως συμβατή$/) do
  page.find('li', :text => 'politis-news.com').click_link("Συμβατή")
end

Τότε(/^να εμφανίζεται η επιλογή επισήμανσης ως μη συμβατή$/) do
  page.find('li', :text => 'politis-news.com').should have_content("Μη Συμβατή")
end
