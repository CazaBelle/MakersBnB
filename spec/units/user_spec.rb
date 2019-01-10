
require './lib/User.rb'


RSpec.describe User do
#     let!(:user) {User.create(name: "Subomi", email: "test@test.com", password: "123456")}

    let!(:user) { User.create(name: "Test", email: "Test@123", password: "1234") }
  context "#create" do
    it "stores user name" do
      expect(user.name).to eq "Test"
    end

      it "stores user email" do
      expect(user.email).to eq "Test@123"
    end

      it "stores user password" do
      expect(user.password).to eq "1234"
    end
  end

    describe '#authenticate' do
        user = User.create(name: "Test2", email: "Test2@123", password: "5678")

        it 'exists?' do
            expect(User.authenticate(user.email, "5678")).to eq user
        end

        it 'password is wrong' do
          expect(User.authenticate(user.email, "1234")). to eq nil
        end

        it 'wrong email' do
          expect(User.authenticate("Wrongemail@123", "5678")).to eq nil
      end

        it "checks for duplicate email" do
          user2 = User.create(name: "Test2", email: "Test2@123", password: "5678")
          expect(user.valid?).to eq true
          expect(user2.valid?).to eq false
        end
    end
end
