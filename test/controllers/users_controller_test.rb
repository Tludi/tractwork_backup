require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  def setup
    login_user(user = users(:user1), route = login_url)
  end

  # def teardown

  # end

  test "should get user index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

end
