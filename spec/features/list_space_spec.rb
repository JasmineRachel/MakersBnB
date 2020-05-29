
feature 'adding a space' do
    scenario 'User can add a space' do
    visit ('/spaces/new')
    fill_in 'address', with: ('Audley')
    fill_in 'no_bedrooms', with: ('3')
    click_button 'Add Space'
    expect(page).to have_content 'Audley'
    end
end
