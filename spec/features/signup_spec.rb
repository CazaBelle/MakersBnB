RSpec.feature "Create user" do
  context "Signup" do
    scenario "User can signup for an account" do

      signup_steps
      expect(page.current_path).to eq "/signin"

    end
  end

end
