source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 6.0.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'coveralls', require: false
gem 'active_model_serializers'
gem 'faker'
gem 'aws-sdk-s3'
gem 'rack-cors', require: 'rack/cors'
gem 'devise_token_auth'
gem 'elasticsearch-model', '~> 0.1.8'
gem 'elasticsearch-api',  '~> 1.0.15'
gem 'elasticsearch-transport',  '~> 1.0.15'

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end