require 'test_helper'

class Web::UsersControllerTest < ActionDispatch::IntegrationTest
  test "GET /users/new returns 200" do
    get new_user_url(subdomain: "www")
    assert_response :success
  end

  test "POST /users w/ valid params redirects to root" do
    params = {
      username:              "test-user",
      email:                 "test-user@example.com",
      password:              "password",
      password_confirmation: "password",
    }
    post users_url(subdomain: "www"), params: { user: params }
    assert_redirected_to root_url(subdomain: "www")

    assert User.exists?(username: params[:username], email: params[:email])
  end

  test "POST /users w/ invalid params renders :new page" do
    params = {
      username:              "test-user",
      email:                 "",
      password:              "password",
      password_confirmation: "incorrect",
    }
    post users_url(subdomain: "www"), params: { user: params }
    assert_response :success

    refute User.exists?(username: params[:username], email: params[:email])
  end
end
