source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem 'activeadmin'
gem 'activerecord-import', '~> 1.2'
gem 'after_commit_everywhere', '~> 1'
gem 'caxlsx', '~> 3.1'
gem 'caxlsx_rails', '~> 0.6'
gem 'propshaft'
gem 'rubyzip', '~> 2'
gem 'rubyXL', '~> 3.4'
gem "rails", "~> 7.0.3"
gem "ransack", "~> 3.2"
gem 'stimulus-rails'
gem 'turbo-rails'
gem "pg", "~> 1.1"
gem "pagy", "~> 6.0"
gem "puma", "~> 5.0"
gem 'net-ssh'
gem "jsbundling-rails"
gem "cssbundling-rails"
gem 'devise'
gem "jbuilder"
gem 'redis', '~> 4.0'
gem 'sidekiq', '~> 6.5'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 5.1", ">= 5.1.2"
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'bullet'
  gem 'dotenv-rails'
end

group :development do
  gem "web-console"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
