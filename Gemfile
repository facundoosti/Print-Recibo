source "http://rubygems.org"

gem "haml", "4.0.3"
gem "rake", "12.0.0"
gem "rack-contrib", "1.1.0"
gem "rack-flash3", "1.0.3" , require: "rack-flash"
gem "rack-protection", "1.5.0"
gem "rack-rewrite", "1.5.0"
gem "rack-recaptcha", "0.6.6"
gem "puma", "3.6.2"
gem "sinatra",'1.4.8', require: "sinatra/base"
gem "sinatra-contrib", "1.4.7", require: ["sinatra/contrib", "sinatra/content_for", "sinatra/reloader", "sinatra/namespace"]
gem "sinatra-partial", "1.0.0", require: "sinatra/partial"
gem "sinatra-activerecord", require: "sinatra/activerecord"
gem "prawn", require: "prawn"
gem "prawn-table","0.2.2", require: "prawn/table"
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
