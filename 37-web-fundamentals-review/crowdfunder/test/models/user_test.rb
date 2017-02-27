require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "email must be unique" do
    user = FactoryGirl.create(:user, :email_no_sequence)
    user2 = FactoryGirl.build(:user, :email_no_sequence)
    refute user2.valid?
  end

  test "user must include password_confirmation on create" do
    user = FactoryGirl.build(:user, :no_confirm)
    refute user.valid?
  end

  test "password must match confirmation" do
    user = FactoryGirl.build(:user, password: 'password1', password_confirmation: 'password2')
    refute user.valid?
  end

  test "password must be at least 8 characters long" do
    user = FactoryGirl.build(:user, password: '1234', password_confirmation: '1234')
    refute user.valid?
  end

  test "user is valid with default factory" do
    user = FactoryGirl.build(:user)
    assert user.valid?
  end
end
