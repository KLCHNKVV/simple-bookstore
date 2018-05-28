source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'pg'
gem "passenger"
gem "sqlite3"
gem 'sass-rails', '~> 5.0'
gem 'uglifier't
gem 'twitter-bootstrap-rails'
gem 'bootstrap-sass'
gem 'execjs'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt'
gem 'devise'
gem 'rails_admin'
gem 'turbolinks'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-slick-rails'
gem 'sunspot_rails'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
end

group :development do
  gem 'rails-erd'
  gem 'railroady'
  gem 'sunspot_solr'
  gem 'sunspot'
  gem 'nifty-generators'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'responders'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'mocha', group: :test
ruby "2.5.0"