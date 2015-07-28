require 'factory_girl'

FactoryGirl.define do
  
  factory :user do |f|
    f.name 'duplicateuser'
    f.email 'duplicate@email.com'
    f.password 'password'
    f.password_confirmation 'password'
  end
  
end

