require "data_mapper"

class Booking 

  include DataMapper::Resource
  property :id, Serial

end 
