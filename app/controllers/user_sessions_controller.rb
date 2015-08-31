class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  before_filter :require_login_from_http_basic, :only => [:login_from_http_basic]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:root, notice: 'Login successful')
    else
      flash.now[:alert] = "Login failed"
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end

  def login_from_http_basic
    redirect_to users_path, :notice => 'Login from basic auth successful'
  end
end
