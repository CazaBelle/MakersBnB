require './lib/User.rb'

RSpec.describe User do
    #let(:password) { double :password }
    #let(:user) { User.create(email: "Test@123", password: :password) }

    it 'checks email exist' do
        user = User.create(email: "Test@123", password: "1234")
        expect(user.authenticate(user.email, user.password)).to eq user
    end


    
end
