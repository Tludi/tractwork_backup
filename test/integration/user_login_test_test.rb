require 'test_helper'

class UserLoginTestTest < ActionDispatch::IntegrationTest


  def setup
    @account = Account.create!(name: "first account")
    @account2 = Account.create!(name: "second account")
    @user = User.create(name: "milo", password: "password", account_id: @account.id)
    @user2 = User.create(name: "bloom", password: "password", account_id: @account2.id)
  end

  def teardown
    @user.destroy!
    @account.destroy!
    @user2.destroy!
    @account2.destroy!
  end


  test "login and redirect to dashboard" do
    milo = login(@user)
  end

  private

    module CustomDsl
      def getDashboard
        get "/dashboard"
        assert_response :success
        assert_assigns(:dashboard)
      end
    end

    def login(user)
      open_session do |sess|
        session.extend(CustomDsl)
        u = users(user)
        sess.https!
        sess.post "/login", name: u.name, password: u.password
        assert_equal '/dashboard', sess.path
        sess.https!(false)
      end
    end
end
