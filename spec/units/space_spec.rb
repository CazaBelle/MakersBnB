require './lib/space.rb'

RSpec.describe Space do
  let!(:space) { Space.create(name: "Test Couch", description: "Test description", price: "Test price") }

  describe "#create" do
    it "creates a space name" do
      expect(space.name).to eq "Test Couch"
    end
  end
end
