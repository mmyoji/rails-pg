require 'test_helper'

class Web::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success

    get root_url
    assert_response :success
  end
end
