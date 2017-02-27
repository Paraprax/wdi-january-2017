require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "new returns a success" do
    get :new
    assert_response :success
  end

  test "create adds a new user" do
    user = FactoryGirl.build(:user)
    assert_difference('User.count') do
      post :create, params: {user: {email: user.email, password: user.password, password_confirmation: user.password_confirmation}}
    end
  end

  test "create redirects to projects page on success" do
    user = FactoryGirl.build(:user)
    post :create, params: {user: {email: user.email, password: user.password, password_confirmation: user.password_confirmation}}
    assert_redirected_to projects_url
  end

  test "create renders new on failure" do
    user = FactoryGirl.create(:user, :email_no_sequence)
    user2 = FactoryGirl.build(:user, :email_no_sequence)
    post :create, params: {user: {email: user2.email, password: user2.password, password_confirmation: user2.password_confirmation}}
    assert_template :new
  end
end
