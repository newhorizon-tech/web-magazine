describe 'the article creation process', type: :feature do
  before do
    user = User.create_or_find_by(name: 'test_user')
    login_as(user)
    visit '/articles/new'
  end

  it 'gives an error when submitting a blank article with no attributes' do
    click_button 'Create Article'
    msg = find('div.flash.lead')
    expected_msg = "Image can't be blank," \
                   " Title can't be blank," \
                   ' Title is too short (minimum is 3 characters),' \
                   ' and At least one category must be selected'
    expect(msg).to have_content expected_msg
  end

  it 'gives an error when submitting an article with short title' do
    within('form') do
      fill_in 'Title', with: 'Ti'
    end
    click_button 'Create Article'
    msg = find('div.flash.lead')
    expected_msg = "Image can't be blank," \
                   ' Title is too short (minimum is 3 characters),' \
                   ' and At least one category must be selected'
    expect(msg).to have_content expected_msg
  end

  it 'gives an error when submitting an article with no categories' do
    within('form') do
      fill_in 'Title', with: 'Title'
    end
    click_button 'Create Article'
    msg = find('div.flash.lead')
    expected_msg = "Image can't be blank" \
                   ' and At least one category must be selected'
    expect(msg).to have_content expected_msg
  end
end
