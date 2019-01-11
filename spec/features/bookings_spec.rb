require './lib/booking'

RSpec.feature "Bookings" do 
  scenario "User can see available properties" do 
    signup_steps
    signin_steps
    add_space
    click_button "Make a booking"
    expect(page).to have_current_path '/properties'
    expect(page).to have_content 'Which Amazing Property Would You Like'
  end  
end