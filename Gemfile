source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'roo'
gem "iconv"

group :development, :test do
  gem 'rspec-rails'
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'coveralls', require: false
  gem 'simplecov', require: false
end

group :production do
   gem 'pg'
   gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.4.0'
