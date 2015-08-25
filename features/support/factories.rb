require 'factory_girl'

FactoryGirl.define do

  # merge them in one class and overwrite them - like subscribe
  
  factory :ada, class: User do |f|
    f.username 'ada'
    f.email 'ada@sociopub.com'
    f.password 'password'
    f.password_confirmation 'password'
  end

  factory :alan, class: User do |f|
    f.username 'alan'
    f.email 'alan@sociopub.com'
    f.password 'enigma'
    f.password_confirmation 'enigma'
    f.activated 'true'
  end

  factory :ted, class: User do |f|
    f.username 'ted'
    f.email 'ted@sociopub.com'
    f.password 'database'
    f.password_confirmation 'database'
    f.activated 'true'
    f.admin 'true'
  end

  # merge them in one class and overwrite them - like the following one

  factory :theguardian, class: Feed do |f|
    f.title 'The Guardian'
    f.url 'http://www.theguardian.com/uk/rss'
  end
  
  factory :wired, class: Feed do |f|
    f.title 'Wired'
    f.url 'http://www.wired.co.uk/news/rss'
  end

  factory :philenews, class: Feed do |f|
    f.title 'Philenews'
    f.url 'http://www.philenews.com/Publications/RssModule/rss.aspx?CategoryId=399'
  end
  
  factory :subscribe_user_to_feed, class: Subscription do |f|
    f.user_id '0'
    f.feed_id '0'
  end

  
  factory :website do |f|
    f.url ' '
    f.compatible 'f'
  end
  
end

