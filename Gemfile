source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'

# Use feedjira for fetching and parsing RSS feeds
gem 'feedjira'

# User Rails Internationalization API
gem 'rails-i18n', '4.0.4'

# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

gem 'bootstrap-sass', '3.3.5'
gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  
  gem 'faker', '1.4.2'

end

group :test do
  gem 'cucumber-rails', '1.4.0', :require => false
  #  gem 'capybara-email', '2.4.0'
  gem 'email_spec', '1.6.0'
  gem 'action_mailer_cache_delivery', '0.3.7'
  gem 'show_me_the_cookies', '3.0.0'
  gem 'rspec-rails', '2.11.0'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace', '0.1.3'
  gem 'guard-minitest', '2.3.1'
  gem 'sqlite3', '1.3.10'
end


group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'puma', '2.11.1'
end
