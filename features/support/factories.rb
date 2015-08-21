require 'factory_girl'

FactoryGirl.define do
  
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


  factory :authenticated_user, class: User do |f|
    f.username 'authenticated'
    f.email 'authenticated@email.com'
    f.password 'password'
    f.password_confirmation 'password'
    f.activated 'true'
  end



end

