require 'test_helper'

class Web::ResendConfirmationEmailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:mmyoji)

    sign_in @user, "password"
  end

  test "GET /resend_confirmation_email/new" do
    get new_resend_confirmation_email_url
    assert_response :success
  end

  test "POST /resend_confirmation_email" do
    token = @user.confirmation_token.dup
    post resend_confirmation_email_url
    assert_response :found

    refute_equal @user.reload.confirmation_token, token
  end

  private

  def sign_in(user, password)
    post sessions_url, params: { user: { email: user.email, password: password } }
  end
end
