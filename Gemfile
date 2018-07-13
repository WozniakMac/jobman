# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

group :development, :test do
  gem 'rspec'
  gem 'simplecov', require: false
end

group :development do
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'guard-rubocop', require: false
  gem 'rubocop', '~> 0.55.0', require: false
  gem 'rubocop-rspec'
end
