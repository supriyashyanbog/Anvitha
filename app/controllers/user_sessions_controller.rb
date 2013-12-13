class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  before_filter :is_active_user?, :only => [:create]
  layout 'admin'
  
  def new
    @user_session = UserSession.new
    render :layout => 'admin'
  end
  
  def create    
    @user_session = UserSession.new(params[:user_session])
    if flash[:error].blank? && @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default users_url
    else
      flash[:error] = "Please verify your username and password." if flash[:error].blank?
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
  
  private
  def is_active_user?
    user = User.find_by_username(params[:user_session][:username])
    return if user.blank?
    flash[:error] = "Please contact Admin to enable access" unless user.active
  end
end
