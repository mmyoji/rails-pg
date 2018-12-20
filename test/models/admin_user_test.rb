require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  setup do
    @admin_user = admin_users(:one)
    @params = {
      username:              "sample-user",
      email:                 "sample-user@example.com",
      password:              "password",
      password_confirmation: "password",
    }
  end

  test "username must be present, unique and <= 16" do
    admin_user = AdminUser.new(@params)
    assert admin_user.valid?

    admin_user.username = ""
    refute admin_user.valid?

    admin_user.username = @admin_user.username.dup
    refute admin_user.valid?

    admin_user.username = "a" * 16
    assert admin_user.valid?

    admin_user.username = "a" * 17
    refute admin_user.valid?
  end

  test "email must be present, unique and in valid format" do
    admin_user = AdminUser.new(@params)

    admin_user.email = ""
    refute admin_user.valid?

    admin_user.email = @admin_user.email.dup
    refute admin_user.valid?

    [
      "foo.com",
      "foo@",
      "@example.com",
      "@",
      "これは@不正です.com",
    ].each do |invalid_email|
      admin_user.email = invalid_email
      refute admin_user.valid?
    end
  end

  test "password and password_confirmation must be present and the same" do
    admin_user = AdminUser.new(@params.merge(password: ""))
    refute admin_user.valid?

    admin_user = AdminUser.new(@params.merge(password_confirmation: ""))
    refute admin_user.valid?

    admin_user = AdminUser.new(@params.merge(password_confirmation: "wrong-password"))
    refute admin_user.valid?

    real_pswd = "ep<[k^]a3A]hhe9+y5U{]dmh;PD[F&p&"
    admin_user = AdminUser.new(@params.merge(password: real_pswd, password_confirmation: real_pswd))
    assert admin_user.valid?
  end
end
