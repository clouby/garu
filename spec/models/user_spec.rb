require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  let(:user) { users(:charlie) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without an email" do
    user.email = nil
    expect(user).to_not be_valid
    expect(user.errors[:email]).to_not be_nil
  end

  it "should have many tasks" do
    expect(user).to respond_to(:tasks)
  end
end
