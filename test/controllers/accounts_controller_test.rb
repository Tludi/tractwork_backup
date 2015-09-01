require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  # test "should create account" do
  #   assert_difference('Account.count') do
  #     assert_difference('User.count') do
  #       post :create!, accounts: { name: 'Sample Account', 
  #                                 users: {
  #                                   id: 1,
  #                                   name: "milo", 
  #                                   email: "test@milo.com",
  #                                   password: "password",
  #                                   password_confirmation: "password",
  #                                   role: "Admin"
  #                                 }
  #                              }
  #     end
  #   end

  #   assert_redirected_to account_path(assigns(:account))
  # end

  # TODO: add test for creating user with account
  
end
