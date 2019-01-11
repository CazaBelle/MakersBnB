RSpec.feature 'List Space' do
  context 'Listing a space' do
    scenario 'A user can list a space' do
      signup_steps
      signin_steps
      click_button 'Add Space'
      fill_in :name, with: "couch"
      fill_in :description, with: "This is a really soft coach"
      fill_in :price, with: "£20"
      click_button "add"
      expect(page.current_path).to eq '/profile/4'
      expect(page).to have_content "Welcome to Makersbnb"
      
    end
  end
end