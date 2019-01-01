source "http://rubygems.org"

gem "haml"
gem "rake"
gem "rack-contrib"
gem "rack-flash3" , require: "rack-flash"
gem "rack-protection"
gem "rack-rewrite"
gem "puma"
gem "sinatra",'1.4.8', require: "sinatra/base"
gem "sinatra-contrib", require: ["sinatra/contrib", "sinatra/content_for", "sinatra/reloader", "sinatra/namespace"]
gem "sinatra-partial", require: "sinatra/partial"
gem "sinatra-activerecord", require: "sinatra/activerecord"
gem "prawn", require: "prawn"
gem "prawn-table", require: "prawn/table"
gem "roo", require: 'roo'
gem "sqlite3", require: 'sqlite3'
gem "spreadsheet", require: 'spreadsheet'

group :development do
  gem "better_errors", "2.1.1"
  gem "binding_of_caller",  "0.7.2"
  gem "rb-readline"
  gem "shotgun", "0.9"
end

group :test, :development do
  gem "pry", "0.10.1",require: "pry"
  gem "pry-byebug", "2.0.0"
end
