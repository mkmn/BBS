require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "show" do
    get :show
    assert_response :success
  end

  test "create" do
    user = Factory(:user, name: "admin", password: "password", password_confirmation: "password")

    post :create, name: "admin", password: "password"
    assert_redirected_to :admin_root
    assert_equal user.id, session[:user_id]
  end

  test "fail to create" do
    user = Factory(:user, name: "admin", password: "password", password_confirmation: "password")

    post :create, name: "admin", password: "admin"
    assert_redirected_to :session
    assert_nil session[:user_id]
  end

  test "dstroy" do
    login_as("admin")

    delete :destroy
    assert_redirected_to :root
    assert_nil session[:user_id]
  end
end
