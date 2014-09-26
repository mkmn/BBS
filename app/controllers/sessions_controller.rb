class SessionsController < ApplicationController
  def show
  end

  def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :admin_root
    else
      redirect_to :session, alert: "名前とパスワードが一致しません"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root
  end
end
