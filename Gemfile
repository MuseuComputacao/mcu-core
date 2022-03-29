# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Authentication
gem 'active_model_serializers', '~> 0.10.10'
gem 'devise_token_auth', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Preprocessor for email HTML to convert components in table structure https://get.foundation/emails/docs/inky.html#how-to-inky
gem 'inky-rb', require: 'inky'
# Stylesheet inlining for email (used by inky) https://github.com/fphilipe/premailer-rails
gem 'premailer-rails'
# Sprockets is a Ruby library for compiling and serving web assets. https://github.com/rails/sprockets
gem 'sprockets'
# This gem integrates the C implementation of Sass, LibSass, into the asset pipeline. https://github.com/sass/sassc-rails
gem 'sassc-rails'
# Handle pagination https://github.com/kaminari/kaminari
gem 'kaminari', '~> 1.2'

group :development, :test do
  # color terminal variables
  gem 'pry'
  # linter for batter used
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.17'
  gem 'rspec-rails', '~> 5.0'
  gem 'rubocop', '~> 1.24', '>= 1.24.1'
  gem 'rubocop-rspec', '~> 2.7'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'database_cleaner-active_record', '~> 2.0'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', '~> 0.21.2', require: false
end

group :development do
  # See emails on development mode
  gem 'letter_opener_web', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
