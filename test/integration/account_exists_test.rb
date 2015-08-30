require 'test_helper'

class AccountandUserExistsTest < ActionDispatch::IntegrationTest

  def setup
    @account = Account.create!(name: "first account")
    @account2 = Account.create!(name: "second account")
    @user = User.create(name: "milo", account_id: @account.id)
    @user2 = User.create(name: "bloom", account_id: @account2.id)
  end

  def teardown
    @user.destroy!
    @account.destroy!
    @user2.destroy!
    @account2.destroy!
  end

  test "Account exists for the user" do
    assert_equal @user.account_id, @account.id
  end

  test "Account must have at least one user" do
    assert_not_nil @account.users
  end

  test "created account has expected user" do
    assert_equal @account.users.first.name, @user.name
  end

  test "check for false positive in user name for account" do
    assert_not_equal @account.users.first.name, @user2.name
  end

  test "user does not exist without an account" do
    
  end
end
