class Admin::Base < ApplicationController
  before_filter :authorize, :admin_login_required

  private
  def authorize
    @current_user = User.find_by_id(session[:user_id])
    session.delete(:user_id) unless @current_user
  end

  def admin_login_required
    raise Forbidden unless @current_user
  end
end
