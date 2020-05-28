
feature 'adding a space' do
    scenario 'User can add a space' do
    visit ('/add_space')
    fill_in 'Address', with: ('Audley')
    fill_in 'Bedrooms', with: ('3')
    click_button 'Submit' 
    expect(page).to have_content 'Audley'
    end
end
