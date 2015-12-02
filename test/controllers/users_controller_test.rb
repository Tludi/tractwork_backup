require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller

  # testing login of user
  def setup
    @user = users(:user1)

    login_user(user = @user, route = login_url)
  end

  # def teardown

  # end

  test "should get user index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "current user should be user 1" do
    assert_equal "milo", @user.name
  end

end
