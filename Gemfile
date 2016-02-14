source 'https://rubygems.org'

gem 'rails', github: "rails/rails"

gem 'pg'
# gem 'jbuilder', '~> 2.0'
gem 'puma'
# gem 'bcrypt', '~> 3.1.7'
# gem 'capistrano-rails', group: :development
# gem 'rack-cors'

gem 'devise', github: 'plataformatec/devise', branch: 'master'
gem 'omniauth'
gem 'russian', '~> 0.6.0'
gem 'pry-rails', '~> 0.3.4'
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth', branch: 'master'
gem 'active_model_serializers', github: 'rails-api/active_model_serializers', branch: 'master'
gem 'cancancan', '~> 1.13'
gem 'unicorn', '~> 5.0.1'
gem 'aws-sdk-rails'

group :development, :test do
  gem 'byebug'
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "git://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker'
end

group :development do
  gem 'spring'
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.1.6'
  gem 'capistrano-bundler', '~> 1.1.4'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano3-unicorn', '~> 0.2.1'
end

group :test do
  gem 'database_cleaner', '~> 1.5.1'
  gem 'shoulda-matchers', '~> 3.0'
  gem 'cucumber-rails', :require => false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
