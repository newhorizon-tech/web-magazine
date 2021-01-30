module LoginHelpers
  def login_as(user)
    visit '/users/new'
    within('form') do
      fill_in 'Enter your username', with: user.name
    end
    click_button 'Login'
  end
end
