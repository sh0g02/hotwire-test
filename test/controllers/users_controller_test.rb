require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_path
    assert_response :success
    assert_select "h1", "Users"
    assert_select ".users-table"
  end
end
