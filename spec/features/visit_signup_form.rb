require 'setup_test_database'
require 'spec_helper'

feature 'homepage' do
  scenario 'user can visit homepage' do
    visit('/')
    click_link('Signup')
    expect(page).to have_content('Email address')
  end
end
