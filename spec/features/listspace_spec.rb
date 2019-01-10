RSpec.feature 'List Space' do
  context 'Listing a space' do
    scenario 'A user can list a space' do
      visit '/listspace'
      fill_in :name, with: "James' couch"
      fill_in :description, with: "This is a really soft coach"
      fill_in :price, with: "£20"
      click_on "add"
      expect(page.current_path).to eq'/profile'
      expect(page).to have_content "Jame's couch"
      
    end
  end
end