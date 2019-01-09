require './lib/User.rb'
require 'capybara/rspec'

feature "checks homepage has signin button" do
    scenario "homepage signin button" do
        visit '/'
        expect(page).to have_content("Sign In")
    end
end