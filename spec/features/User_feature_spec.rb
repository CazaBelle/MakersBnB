require './lib/User.rb'
require 'capybara/rspec'
require './spec/feature_helper'

feature "#Signin " do
		scenario "homepage exists" do
				visit '/'
				expect(page).to have_content("Homepage")
		end

		scenario "Clicks signin button" do
				visit '/'
				click_button 'Sign In'
		end

		scenario "Sign in button takes user to sign in page" do
				signup_steps
				signin_steps
				expect(page).to have_current_path('/profile')
		end


end
