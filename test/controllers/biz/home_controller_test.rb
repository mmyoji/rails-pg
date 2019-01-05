require 'test_helper'

class Biz::HomeControllerTest < ActionDispatch::IntegrationTest
  test "GET #index" do
    get biz_root_url
    assert_response :success
  end
end
