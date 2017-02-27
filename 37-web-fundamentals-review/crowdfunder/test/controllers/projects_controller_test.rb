require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test "index returns success" do
    get :index
    assert_response :success
  end

  test "show returns success" do
    project = FactoryGirl.create(:project)
    get :show, params: {id: project.id}
    assert_response :success
  end

  test "new returns success when logged in" do
    user = FactoryGirl.create(:user)
    login_user(user = user)
    get :new
    assert_response :success
  end

  test "new redirects to login when logged out" do
    logout_user
    get :new
    assert_redirected_to login_url
  end

  test "create redirects to login when logged out" do
    project = FactoryGirl.create(:project)
    logout_user
    post :create, params: { project: project.as_json }
    assert_redirected_to login_url
  end

  test "create renders new when logged in and invalid" do
    user = FactoryGirl.create(:user)
    login_user(user = user)
    post :create, params: { project: {title: 'test'} } # missing required params
    assert_template :new
  end

  test "create redirects to projects when logged in and valid" do
    user = FactoryGirl.create(:user)
    project = FactoryGirl.create(:project)
    login_user(user = user)
    post :create, params: { project: project.as_json }
    assert_redirected_to projects_url
  end
end
