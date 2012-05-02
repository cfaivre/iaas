source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem "bson_ext"
gem "mongoid"
gem "nested_form"
gem 'jquery-rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test, :spec, :cucumber do
    gem "rspec"
    gem "rspec-rails"#, ">= 2.0.0.beta"
    gem "capybara"
    gem "cucumber"
    gem "database_cleaner"
    gem "cucumber-rails"
    gem "spork"
    gem "launchy"
    gem "nifty-generators"
    gem "mocha"
end

group :test, :development do
  gem 'capistrano'
  gem 'capistrano-ext'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "mocha", :group => :test
