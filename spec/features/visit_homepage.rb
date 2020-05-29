require 'setup_test_database'
require 'spec_helper'

feature 'homepage' do
  scenario 'user can visit homepage' do
    visit('/')
    find_link('Login').visible?
  end
end
