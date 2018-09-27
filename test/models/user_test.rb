require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:mmyoji)
    @params = {
      username:              "sample-user",
      email:                 "sample-user@example.com",
      password:              "password",
      password_confirmation: "password",
    }
  end

  test "username must be present, unique and <= 16" do
    user = User.new(@params)
    assert user.valid?

    user.username = ""
    refute user.valid?

    user.username = @user.username.dup
    refute user.valid?

    user.username = "a" * 16
    assert user.valid?

    user.username = "a" * 17
    refute user.valid?
  end

  test "email must be present, unique and in valid format" do
    user = User.new(@params)

    user.email = ""
    refute user.valid?

    user.email = @user.email.dup
    refute user.valid?

    [
      "foo.com",
      "foo@",
      "@example.com",
      "@",
      "これは@不正です.com",
    ].each do |invalid_email|
      user.email = invalid_email
      refute user.valid?
    end
  end

  test "password and password_confirmation must be present and the same" do
    user = User.new(@params.merge(password: ""))
    refute user.valid?

    user = User.new(@params.merge(password_confirmation: ""))
    refute user.valid?

    user = User.new(@params.merge(password_confirmation: "wrong-password"))
    refute user.valid?

    real_pswd = "ep<[k^]a3A]hhe9+y5U{]dmh;PD[F&p&"
    user = User.new(@params.merge(password: real_pswd, password_confirmation: real_pswd))
    assert user.valid?
  end
end
