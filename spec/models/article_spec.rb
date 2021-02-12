# spec/models/article_spec.rb

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:test_user) { User.create_or_find_by(name: 'Test') }
  let(:test_category) { Category.create_or_find_by(name: 'Test', priority: 1) }

  it 'is not valid without an author' do
    article = Article.new(author: nil, title: 'Title')
    expect(article).to_not be_valid
  end

  it 'is not valid without a title' do
    article = Article.new(author: test_user, title: nil)
    expect(article).to_not be_valid
  end
  it 'is not valid with a short title' do
    article = Article.new(author: test_user, title: '123')
    expect(article).to_not be_valid
  end
  it 'is valid with valid attributes' do
    cat_id = test_category.id
    article = Article.new(author: test_user, title: '123', category_ids: [cat_id])
    article.grab_image
    expect(article).to be_valid
  end
end
