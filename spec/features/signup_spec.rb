RSpec.feature "Create user" do
  context "Signup" do
    scenario "User can signup for an account" do

      visit "/"
      click_on "signup"
      fill_in :name, with: "Subomi"
      fill_in :email, with: "test@test.com"
      fill_in :password, with: "password123"
      click_button "signup"
      expect(page.current_path).to eq "/signin"

    end
  end

end
