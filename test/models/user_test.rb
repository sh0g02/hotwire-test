require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should create user with valid attributes" do
    user = User.new(name: "John Doe", email: "john@example.com")
    assert user.valid?
  end

  test "should not create user without name" do
    user = User.new(email: "john@example.com")
    assert_not user.valid?
  end
end
