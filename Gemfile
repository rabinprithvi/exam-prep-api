source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
gem 'sqlite3', '~> 1.3.13'
gem 'puma', '~> 3.0'
gem 'jbuilder', '~> 2.6'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.6.0'
  gem "factory_bot_rails", "~> 4.10.0"
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
