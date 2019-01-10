require './lib/User.rb'
require 'pry'

RSpec.describe User do
    #let(:password) { double :password }
    let!(:user) { User.create(name: "Test", email: "Test@123", password: "1234") }

    context 'Sign In' do
        it 'checks name exists' do
            expect(user.name).to eq "Test"
        end
    
        it 'checks email exists' do
            expect(user.email).to eq "Test@123"
        end

        it 'checks password exists' do
            expect(user.password).to eq "1234"
        end
    end

    describe '#authenticate' do
        user = User.create(name: "Test2", email: "Test2@123", password: "5678")

        it 'exists?' do
            expect(User.authenticate(user.email, "5678")).to eq user
        end
    end


end
