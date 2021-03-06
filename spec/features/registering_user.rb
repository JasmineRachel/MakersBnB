require 'setup_test_database'
require 'spec_helper'

feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('First Name', with: 'Test')
    fill_in('Last Name', with: 'Testerton')
    fill_in('Email Address', with: 'test@gmail.com')
    fill_in('Password', with: 'password123')
    click_button('Signup')

    expect(page).to have_content "Welcome Test, you have now registered for Makers BnB!"
  end
end
