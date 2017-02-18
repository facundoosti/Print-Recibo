# encoding: utf-8

require './init'

run Rack::URLMap.new(
  '/'  => PrintRecibos::App.new,
)