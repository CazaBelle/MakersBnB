def signup_steps
  visit "/"
  click_on "signup"
  fill_in(:name, with: 'test')
  fill_in(:email, with: 'test@test.com')
  fill_in(:password, with: 'secret123')
  click_button "signup"
end

def signin_steps
  visit '/signin'
  expect(page).to have_content 'Name'
  expect(page).to have_content 'Email'
  expect(page).to have_content 'Password'
  fill_in(:name, with: 'test')
  fill_in(:email, with: 'test@test.com')
  fill_in(:password, with: 'secret123')
  click_button "Sign In"
end
