require 'test_helper'

class AccountsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: {name: 'Sample Account'}
    end

    assert_redirected_to account_path(assigns(:account))
  end

  # TODO: add test for creating user with account
  
end
