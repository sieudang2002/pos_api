source "https://rubygems.org"
ruby "2.4.6"

gem "rails", "4.2.8"
gem "uglifier"
gem "pg", '0.18.4'
gem "hirefire-resource"
gem "rb-readline"

gem "rest-client", ">= 1.8.0"
gem "delayed_job_active_record"

gem "grape", "1.1.0"
gem "grape-roar"
gem "grape-entity"
gem "grape-swagger"
gem "grape-swagger-rails"
gem "grape_on_rails_routes"
gem "hashie-forbidden_attributes"

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw]

gem "nokogiri"
gem "httpclient"
gem "savon"

gem "aws-sdk-s3", "~> 1"
gem "aws-sdk-rails"
gem "ox"

gem "geocoder"
gem "oauth2"

gem "carmen"
gem "therubyracer"

# gem 'paper_trail'

# support debugging in production
gem "ruby-debug-ide"
gem "debase"

group :staging, :production do
  # gem "bugsnag"
  # gem "newrelic_rpm"
  gem "rails_12factor"
  # gem "puma"
  # gem "puma_worker_killer"
end

group :development, :test do
  gem "byebug"
  gem "dotenv-rails"
  # gem "rspec-rails"
  # gem "factory_girl_rails"
  # gem "capybara"
  # gem "database_cleaner"
  # gem "pry-rails"
  # gem "pry-nav"
  # gem "rubocop"
  # gem "rubocop-rails"
end

group :development do
  gem "web-console", "~> 2.0"
  gem "spring"
  # gem "letter_opener"
  # gem "rufo"
end

