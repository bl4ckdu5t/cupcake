source 'https://rubygems.org'
ruby "2.1.2"
# AWS SDK with Paperclip for uploads
gem 'paperclip'
gem 'aws-sdk'
# Newrelic for monitoring
gem 'newrelic_rpm'
# Angular Rails Templating for templating within Angular
gem 'angular-rails-templates'
# Rack timeout for timeouts preventing clogging
gem 'rack-timeout'
# Puma web server for concurrent requests
gem 'puma'
# Intercom for site monitoring
gem 'intercom-rails'
# Figaro for local environment variables
gem 'figaro'
# Devise for authentication
gem 'devise'
# Susy Grids
gem 'susy', '2.1.2'
# Use Autoprefixer
gem 'autoprefixer-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgreSQL as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :production do
   gem 'heroku-deflater'
   gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Rspec for Behaviour Driven Development
  gem 'rspec-rails', '~> 3.0'

  # Factory girls for fixtures
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
end
