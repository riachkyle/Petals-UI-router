source 'https://rubygems.org'

gem 'rails', '4.0.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'font-awesome-sass', '~> 4.2.0'

#uploading photos
gem "paperclip", "~> 4.2"
gem 'aws-sdk'

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

#for angularjs to work nicely on rails
gem 'angularjs-rails'
gem 'active_model_serializers'
gem 'angular-rails-templates'

# debugging tools
group :development do
  gem 'meta_request'
  gem "better_errors"
  gem "binding_of_caller"
end

# testing
group :development, :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'guard-rspec', require: false
  gem 'shoulda-matchers'

  gem "jasmine", github: "pivotal/jasmine-gem" #js testing
  gem "rack-test", require: "rack/test"
end

gem 'rails_12factor', group: :production

ruby "2.1.2"
