
require "./lib/User"
require "./lib/space.rb"

DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV["RACK_ENV"]}")

DataMapper.finalize

# DataMapper.auto_upgrade! if ENV['RACK_ENV'] == 'development'

# DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
