require 'factory_girl'

FactoryGirl.define do

  factory :user do |f|
    f.name 'testuser'
  end
  
  factory :micropost do |f|
    f.association :user
    f.content 'Test message content'
  end
  
end

