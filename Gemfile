source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem "bootstrap-sass", "~> 3.3"
gem "font-awesome-rails", "~> 4.3"

group :development, :test do
  gem 'byebug'
  gem "rspec-rails", "~> 3.2.1"
  gem 'spring-commands-rspec'
  gem 'guard-rails', require: false
  gem 'guard-rspec', require: false
  gem 'rb-fsevent' if `uname` =~ /Darwin/
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry'
  gem 'pry-rails'
end

group :test do
  gem "capybara", "~> 2.4"
  gem "factory_girl_rails", "~> 4.5"
end
