source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Basics
ruby '2.6.4'
gem 'rails', '~> 5.2.4'

gem 'bootsnap'
gem 'bootstrap'
gem 'carrierwave'
gem 'coffee-rails'
gem 'devise'
gem 'devise-i18n'
gem 'figaro'
gem 'flatpickr_rails'
gem 'lightbox-bootstrap-rails', '5.1.0.1'
gem 'fog-aws'
gem 'jquery-rails'
gem 'pundit'
gem 'rails-i18n', '~> 5.1'
gem 'resque'
gem 'rmagick'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # To deploy with capistrano
  gem 'capistrano', '~> 3.8.1'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-resque', require: false

  gem 'factory_bot'
  gem 'letter_opener'
  gem 'listen'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'sqlite3'
end
