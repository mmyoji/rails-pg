require 'test_helper'

class Biz::HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    biz_sign_in staff_members(:one)
  end

  test "GET #index" do
    get biz_root_url
    assert_response :success
  end
end
