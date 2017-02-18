# Bundler, require default Gems
require 'bundler'
require 'json'

env = ENV['RACK_ENV'] || 'development'
Bundler.require :default, env

# Require app code
Dir['app/*.rb'].sort.each { |req| require_relative req }
Dir['app/routes/**/*.rb'].sort.each { |req| require_relative req }
Dir['app/reports/*.rb'].sort.each { |req| require_relative req }
Dir['app/helpers/*.rb'].sort.each { |req| require_relative req }