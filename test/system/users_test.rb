require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # Use fixtures instead of creating users in setup
  fixtures :users

  test "visiting the index" do
    visit users_url

    assert_selector "h1", text: "Users"
    assert_selector "table.users-table"

    # Check if users are displayed in the table
    assert_selector "td", text: users(:john).name
    assert_selector "td", text: users(:john).email
    assert_selector "td", text: users(:jane).name
    assert_selector "td", text: users(:jane).email
    assert_selector "td", text: users(:bob).name
    assert_selector "td", text: users(:bob).email
  end
end
