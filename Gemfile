source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "faker"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-turbolinks"
gem "kaminari"
gem "material_icons"
gem "materialize-sass"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.4"
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "rspec"
  gem "rspec-rails"
  gem "rspec-collection_matchers"
  gem "factory_girl_rails"
  gem "better_errors"
  gem "guard-rspec", require: false
  gem "database_cleaner"
  gem "brakeman", require: false
  gem "jshint"
  gem "bundler-audit"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "eslint-rails"
  gem "rails_best_practices"
  gem "reek"
  gem "railroady"
  gem "autoprefixer-rails"
end

group :test do
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "simplecov-json"
  gem "shoulda-matchers"
  gem "faker"
  gem "guard-rspec"
  gem "rspec-html-matchers"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
