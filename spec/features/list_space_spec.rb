
feature 'adding a space' do
    scenario 'User can add a space' do
    visit ('/add_space')
    fill_in 'Space', with: ('Audley')
    click_button 'ADD SPACE' 
    expect(page).to have_content 'Audley'
    end
end
