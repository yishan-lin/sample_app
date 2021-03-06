require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "example@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name length maximum" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  # test "the truth" do
  #   assert true
  # end
end
