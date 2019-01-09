require 'data_mapper'



DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV["RACK_ENV"]}")

DataMapper.finalize

if ENV['RACK_ENV'] == 'development'
  DataMapper.auto_upgrade! 
else
  DataMapper.auto_migrate! 
end 