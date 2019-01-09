require "User"

describe User do

  let!(:user) {User.create(name: "Subomi", email: "test@test.com", password: "123456")}

  context "#create" do
    it "stores user name" do
      expect(user.name).to eq "Subomi"
    end

      it "stores user email" do
      expect(user.email).to eq "test@test.com"
    end

      it "stores user password" do
      expect(user.password).to eq "123456"
    end
  end

end
