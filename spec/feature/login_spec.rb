describe "the login process", type: :feature do
  before :each do
    User.create_or_find_by(name: 'my_user_name')
  end

  it "signs me in" do
    visit '/users/new'
    within("form") do
      fill_in 'Enter your username', with: 'my_user_name'
    end
    click_button 'Login'
    msg = find('div.flash.lead')
    expected_msg = "Welcome back, my_user_name!"
    expect(msg).to have_content expected_msg
  end

  it "gives an error message if no input is given" do
    visit '/users/new'
    click_button 'Login'
    msg = find('div.flash.lead')
    expected_msg = "Your name cannot be blank"
    expect(msg).to have_content expected_msg
  end


  it "strips extra spaces at the beginning and the end of the name" do
    visit '/users/new'
    within("form") do
      fill_in 'Enter your username', with: '    my_user_name     '
    end
    click_button 'Login'
    msg = find('div.flash.lead')
    expected_msg = "Welcome back, my_user_name!"
    expect(msg).to have_content expected_msg
  end


end
