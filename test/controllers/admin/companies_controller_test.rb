require 'test_helper'

class Admin::CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = companies(:one)

    admin_sign_in admin_users(:one)
  end

  test "GET #index returns 200" do
    get admin_companies_url
    assert_response :success
  end

  test "GET #show returns 200" do
    get admin_company_url(@company)
    assert_response :success
  end

  test "GET #show w/ invalid ID returns 404" do
    get admin_company_url(id: 1_000)
    assert_response :not_found
  end

  test "GET #new" do
    get new_admin_company_url
    assert_response :success
  end

  test "GET #edit" do
    get edit_admin_company_url(@company)
    assert_response :success
  end
end
