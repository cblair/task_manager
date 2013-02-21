source 'https://rubygems.org'

gem 'rails', '3.2.11'
ruby '1.9.3'

gem 'rake', '10.0.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#Heroku wants postgresql
gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'

  gem 'therubyracer', '0.9.9'
  gem 'libv8', '~> 3.3.10'
end

gem 'jquery-rails'

gem 'less'
gem "less-rails"
gem "twitter-bootstrap-rails"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

#Only for development
group :development do
  gem 'debugger'
  gem "ruby-prof"
  gem 'simplecov', :require => false, :group => :test
  #gem 'rack-mini-profiler'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

#Devise
gem 'devise'