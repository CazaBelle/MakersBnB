require 'data_mapper'

class User
include DataMapper::Resource

  property :id, Serial
  property :name, String 
  property :email, String 
  property :password, BCryptHash

  def self.authenticate(email, password)
    user = first(email: email)
    return nil unless user
    #binding.pry
    if user.password == password
      user
    else
      "wrong Password"
    end  
    

  end
  
end 