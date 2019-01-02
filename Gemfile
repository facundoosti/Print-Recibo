source "http://rubygems.org"
ruby "2.5.1"

gem "haml"
gem "rake"
gem "rack-contrib"
gem "rack-flash3" , require: "rack-flash"
gem "rack-protection"
gem "rack-rewrite"
gem "puma"
gem "sinatra", require: "sinatra/base"
gem "sinatra-contrib", require: ["sinatra/base", "sinatra/config_file", "sinatra/contrib", "sinatra/content_for", "sinatra/reloader", "sinatra/namespace"]
gem "sinatra-partial", require: "sinatra/partial"
gem "sinatra-activerecord", require: "sinatra/activerecord"
gem "prawn", require: "prawn"
gem "prawn-table", require: "prawn/table"
gem "roo", require: 'roo'
gem 'pg'
gem "spreadsheet", require: 'spreadsheet'

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "rb-readline"
end

group :test, :development do
  gem "pry",require: "pry"
  gem "pry-byebug"
end
