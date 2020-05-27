require 'spec_helper.rb'

feature 'homepage' do
  scenario 'user can visit homepage' do
    visit('/')
    click_link('Login')
    expect(page).to have_content('Email Address')
  end
end
