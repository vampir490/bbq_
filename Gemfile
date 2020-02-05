source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'rails', '~> 5.2.4'

gem 'jquery-rails'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.1'
gem 'pundit'

gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'figaro'

gem 'twitter-bootstrap-rails'

gem 'uglifier', '>= 1.3.0'

gem 'bootsnap'

gem 'coffee-rails'
gem 'bootstrap'
gem 'lightbox-bootstrap-rails', '5.1.0.1'
gem 'flatpickr_rails'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'shoulda-matchers'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'listen'
  gem 'sqlite3'

  gem 'capistrano', '~> 3.8.1'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.2'
end
