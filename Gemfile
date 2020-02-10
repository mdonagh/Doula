source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '3.10'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Authentication 
gem 'devise'

gem 'jquery-rails'

#ECommerce functionality 
# gem 'activemerchant'
# gem 'paypal-sdk-rest'
# gem 'wepay-rails'
gem 'wepay', '~> 0.4.0'


#Contact form functionality https://github.com/plataformatec/mail_form
gem 'mail_form'

#Searching capability 
gem 'elasticsearch-model', '~> 7.0.0.pre'
gem 'elasticsearch-rails'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'pry'
  #debug in ide 
  gem 'ruby-debug-ide'
  gem 'debase'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# POST GIS 
gem 'activerecord-postgis-adapter'

#Bootstrap 
gem 'bootstrap', '~> 4.3.1'

#Social buttons
gem 'social-share-button'

#Multi step forms 
gem 'wicked'

#Font Awesome Icons 
gem 'font-awesome-rails'

#Admin portal 
gem 'rails_admin', '~> 2.0'

#Stripe 
gem 'stripe'

#Datepicker
gem 'bootstrap-datepicker-rails'

#Azure Storage 
gem 'azure-storage', '~> 0.15.0.preview', require: false

#Mailchimp 
gem 'gibbon', '~> 3.0.0'
