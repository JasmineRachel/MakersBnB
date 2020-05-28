require 'setup_test_database'
require 'spec_helper'

feature 'viewing all spaces' do
    scenario 'a User can view all spaces' do
    connection = PG.connect(dbname: 'makersbnb_test') 
    connection.exec("INSERT INTO spaces (address, no_bedrooms) VALUES('123 Fake_st', '2');")
    connection.exec("INSERT INTO spaces (address, no_bedrooms) VALUES('124 Fake_st', '2');")
    visit ('/spaces') 
    expect(page).to have_content '123 Fake_st'
    end
end