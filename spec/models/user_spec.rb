# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, :type => :model do
  it "creates a valid user" do
    user = User.create!(name: "TotallyNewUser")
    expect(user).to be_valid
  end

  it "does not allow duplicates" do
    orig_user = User.create(name: "12345")
    duplicate_user = User.create(name: "12345")
    expect(duplicate_user).to_not be_valid
  end
end
