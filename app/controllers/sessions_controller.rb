class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(session_params)
    if user && user.authenticate(session_params2)
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #ストロングパラメーター？
  private
  def session_params
    params.require(:session).permit(:email)
  end

  private
  def session_params2
    params.require(:session).permit(:password)
  end

end
