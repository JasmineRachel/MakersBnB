require 'setup_test_database'

feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('First Name', with: 'Test')
    fill_in('Last Name', with: 'Testerton')
    fill_in('Email Address', with: 'test@gmail.com')
    fill_in('Password', with: 'password123')
    click_button('Login')

    expect(page).to have_content "Welcome, Test"
  end
end
