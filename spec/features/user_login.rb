feature 'authentication' do
  scenario 'a user can sign in' do
    # Create a test user
    User.create(first_name: 'Test', last_name: 'Testerson', email: 'test@gmail.com', password: 'hello123')

    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test@gmail.com')
    fill_in(:password, with: 'hello123')
    click_button('Login')

    expect(page).to have_content 'Welcome, Test'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(first_name: 'Test', last_name: 'Testerson', email: 'test@gmail.com', password: 'hello123')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Login')

    expect(page).not_to have_content 'Welcome, test@example.com'
    expect(page).to have_content 'Your email or password is incorrect, please try again'
  end
end
