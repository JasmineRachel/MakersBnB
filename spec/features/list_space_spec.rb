
feature 'adding a space' do
    scenario 'User can add a space' do
    visit ('/add_space')
    fill_in 'address', with: ('Audley')
    fill_in 'no_bedrooms', with: ('3')
    click_button 'Submit'
    expect(page).to have_content 'Audley'
    end
end
