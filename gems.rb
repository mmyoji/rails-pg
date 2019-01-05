# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.6.0'

gem 'rails', '5.2.2'

gem 'bcrypt'
gem 'bootsnap', require: false
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'sidekiq'
gem 'uglifier'
gem 'webpacker'

gem 'bigdecimal'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  gem 'listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end
