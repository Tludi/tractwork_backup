require 'test_helper'

class AccountandUserExistsTest < ActionDispatch::IntegrationTest
  # include Sorcery::TestHelpers::Rails::Integration
  # include Sorcery::TestHelpers::Rails::Controller


  test "Account exists for the user" do
    assert_equal users(:user1).account_id, accounts(:account1).id
  end

  test "Account must have at least one user" do
    assert_not_nil accounts(:account1).users
  end

  test "created account has expected user" do
    puts accounts(:account1).users.first.id
    assert_equal accounts(:account1).users.first.name, users(:user1).name
  end

  test "First account user role is admin" do
    assert_equal "Admin", accounts(:account1).users.first.role
  end

  test "check for false positive in user name for account" do
    assert_not_equal accounts(:account1).users.first.name, users(:user2).name
  end

  test "user does not exist without an account" do
    assert_empty User.where(account_id: nil)
  end

  test "associated users are removed when account is deleted" do
    @accountId = accounts(:account1).id
    assert_equal accounts(:account1).id, @accountId
    accounts(:account1).destroy!
    assert_empty User.where(account_id: @accountId)
  end
end
