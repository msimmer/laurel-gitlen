source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
end

# These are for Heroku.
group :production do
  gem 'pg'
  gem 'rails_12factor'
end


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'haml'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'unicorn' # Use unicorn as the app server
gem 'sorcery' # Favorite auth library
gem 'newrelic_rpm' # New Relic for reporting

# Handle uplaods to AWS and background processing
gem 's3_direct_upload'
gem 'paperclip', '~> 3.3'
gem 'aws-sdk'
gem 'sucker_punch', '~> 1.0'