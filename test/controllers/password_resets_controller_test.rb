require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :redirect
  end

  test "should get edit" do
    get :edit
    
    assert_response :redirect
  end

  test "should get update" do
    get :update
    assert_response :redirect
  end

end
