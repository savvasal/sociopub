require 'factory_girl'

FactoryGirl.define do
  
  factory :user do |f|
    f.username 'user'
    f.email 'example@email.com'
    f.password 'password'
    f.password_confirmation 'password'
  end

  factory :duplicate_user, class: User do |f|
    f.username 'duplicateuser'
    f.email 'duplicate@email.com'
    f.password 'password'
    f.password_confirmation 'password'
  end

  factory :authenticated_user, class: User do |f|
    f.username 'authenticated'
    f.email 'authenticated@email.com'
    f.password 'password'
    f.password_confirmation 'password'
    f.activated 'true'
  end

  factory :admin, class: User do |f|
    f.username 'admin'
    f.email 'admin@email.com'
    f.password 'password'
    f.password_confirmation 'password'
    f.activated 'true'
    f.admin 'true'
  end


end

