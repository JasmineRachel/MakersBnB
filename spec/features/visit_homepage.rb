require 'spec_helper.rb'

feature 'homepage' do
  scenario 'user can visit homepage' do
    visit('/')
    find_link('Login').visible?
  end
end
