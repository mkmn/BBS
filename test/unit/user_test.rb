require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "presence" do
    user = User.new

    assert user.invalid?
    assert user.errors.include?(:name)
    assert user.errors.include?(:password)
  end

  test "length" do
    user = Factory.build(:user)

    # 最大文字列長を超えるならFalse
    user.name = "A" * 33
    assert user.invalid?
    assert user.errors.include?(:name)

    # 最大文字列長以内ならTrue
    user.name = "A" * 32
    assert user.valid?

    # 最小文字列長未満ならFalse
    user.password = "A" * 5
    user.password_confirmation = "A" * 5
    assert user.invalid?
    assert user.errors.include?(:password)

    # 最小文字列長以上ならTrue
    user.password = "A" * 6
    user.password_confirmation = "A" * 6
    assert user.valid?
  end

  test "unique" do
    unique_user = Factory(:user)
    test_user = Factory.build(:user)

    # 存在するnameと同一ならFalse
    test_user.name = unique_user.name
    assert test_user.invalid?
    assert test_user.errors.include?(:name)

    # 存在するnameと同一(大文字小文字の区別なし)ならFalse
    test_user.name = unique_user.name.upcase
    assert test_user.invalid?
    assert test_user.errors.include?(:name)
  end

  test "confirmation" do
    user = Factory.build(:user)

    # passwordとpassword_confirmationが同一ならTrue
    assert user.valid?

    # passwordとpassword_confirmationが異なるならFalse
    user.password = "admin_password"
    user.password_confirmation = "password"
    assert user.invalid?
    assert user.errors.include?(:password)
  end
end
