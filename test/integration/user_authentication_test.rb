require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  test "login and logout" do
    user = Factory(:user, name: "admin", password: "password", password_confirmation: "password")

    post "/session", name: "admin", password: "password"
    assert_redirected_to "/admin"
    assert_equal user.id, session[:user_id]

    follow_redirect!
    assert_select "nav.navbar-inverse p.navbar-text", /admin/

    delete "/session"
    assert_redirected_to "/"
    assert_nil session[:user_id]

    follow_redirect!
    assert_select "nav.navbar-inverse p.navbar-text", false
  end
end
