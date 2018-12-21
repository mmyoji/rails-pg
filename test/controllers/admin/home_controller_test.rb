require 'test_helper'

class Admin::HomeControllerTest < ActionDispatch::IntegrationTest
  test "GET #index requires login" do
    get admin_root_url
    assert_redirected_to admin_login_url
  end

  test "GET #index is successful when logged in" do
    # TODO
  end
end
