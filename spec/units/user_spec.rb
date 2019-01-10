require './lib/User.rb'

RSpec.describe User do
    #let(:password) { double :password }
    let(:user) { User.create(name: "Test", email: "Test@123", password: "1234") }

    context 'Sing In' do
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
end
