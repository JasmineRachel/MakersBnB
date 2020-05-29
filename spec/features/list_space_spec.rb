
feature 'adding a space' do
    scenario 'User can add a space' do
    visit ('/spaces/new')
    fill_in 'name', with: ('anything')
    fill_in 'address', with: ('Audley')
    fill_in 'description', with: ('nice')
    fill_in 'no_bedrooms', with: ('3')
    fill_in 'price_per_night', with: ('100')
    click_button 'Add Space'
    expect(page).to have_content 'Audley'
    end
end
