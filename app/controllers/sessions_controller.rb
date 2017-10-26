class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
      session[:user_id] = user.id
      @user = user
      redirect_to :root
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    flash[:notice] = "Logged out"
    redirect_to :root
  end

end
