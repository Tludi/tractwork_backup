require 'test_helper'

class AccountHasProjectsTest < ActionDispatch::IntegrationTest

    test 'Account can have projects' do
      assert accounts(:account1).projects
    end

    test 'Account projects are deleted when account is deleted' do
      @accountId = accounts(:account1).id
      assert_equal accounts(:account1).id, @accountId
      accounts(:account1).destroy!
      assert_empty Project.where(account_id: @accountId)
    end

end
