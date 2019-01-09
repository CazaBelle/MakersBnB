require './lib/User.rb'
require 'capybara/rspec'

feature "#Signin " do
		scenario "homepage has signin button" do
				visit '/'
				expect(page).to have_content("Sign In")
		end

		scenario "Clicks signin button" do 
				visit '/'
				click_button 'Sign In'
		end 

		scenario "Sign in button takes user to sign in page" do 
				visit '/sign-in'
				expect(page).to have_content 'Email'
				expect(page).to have_content 'Password'
				fill_in(:email, with: 'test@test.com')
				fill_in(:password, with: 'secret123')
				click_button "Sign In"
				expect(page).to have_current_path('/')
		end

		
end