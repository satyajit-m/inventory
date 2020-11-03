source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'bootstrap', '~> 4.0'
gem 'carrierwave', '~> 2.0'
gem "figaro"
gem 'font_awesome5_rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'omniauth-google-oauth2'
gem 'popper_js', '~> 1.14.5'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'turbolinks', '~> 5.2.0'
gem 'webpacker', '~> 4.0'
# Reduces boot times through caching; required in config/boot.rb

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'mysql2', '>= 0.4.4'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'better_errors'
  gem 'guard-livereload'
  gem 'listen', '~> 3.0'
  gem 'redis', '~> 4.2.1'
  gem 'sidekiq', '~> 5.0'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  gem 'pg', '~> 0.18.4'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
