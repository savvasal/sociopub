require 'factory_girl'

FactoryGirl.define do

  factory :user do |f|
    f.name 'duplicate_username'
    f.email 'duplicate@email.com'
  end
  
end

