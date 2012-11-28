source 'https://rubygems.org'

gem 'rails', '3.2.1'
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
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
#  OSX Lion wants this fix for Ruby 1.9.3:
#   https://github.com/chuckg/chuckg.github.com/blob/master/ruby/193_and_rdebug.md
#  TODO: Probably want this for other versions of Mac/Linux too.
if RUBY_PLATFORM == 'x86_64-darwin11.3.0'
  #gem 'ruby-debug19', :require => false
  #gem 'ruby-debug-base19', :git => 'https://github.com/tribune/ruby-debug-base19.git', :require => false
  #gem 'linecache19', :git => 'git@github.com:chuckg/linecache19.git', :branch => "0_5_13/dependencies", :require => false

  #gem 'debugger'
else
  #Ubuntu 11.10 likes this. ?
  #gem 'ruby-debug', :platforms => :ruby_18
  #gem 'ruby-debug19', :platforms => :ruby_19
end

#Devise
gem 'devise'

#Bootswatch
#gem 'sass-rails', '~> 3.1'
gem 'bootstrap-sass', '~> 2.1.0.0'
gem 'bootswatch-rails'
