# spec/models/article_spec.rb

require 'rails_helper'

RSpec.describe Article, :type => :model do
  let(:test_user){User.create_or_find_by(name: 'Test')}

  it "is not valid without an author" do
    article = Article.new(author: nil, title: 'Title')
    expect(article).to_not be_valid
  end

  it "is not valid without a title" do
    article = Article.new(author: test_user, title: nil,)
    expect(article).to_not be_valid
  end
  it "is not valid with a short title" do
    article = Article.new(author: test_user,title: '123')
    article.save
    puts article.errors.full_messages.inspect
    expect(article).to_not be_valid
  end
  # it "is valid with valid attributes"
end
