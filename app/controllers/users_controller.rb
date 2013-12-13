class UsersController < ApplicationController
  before_filter :require_user
  before_filter :find_user, :only=> [:approve, :show, :edit, :destroy, :activate, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new(:user_role_id => 4)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to users_url
    else
      render :action => :new
    end
  end
  
  def approve    
  end
  
  def activate
    @user.user_role_id = params[:user][:user_role_id]
    @user.active = true
    flash[:notice] = "Account updated!" if @user.send(:update_without_callbacks)    
    redirect_to users_url
  end
  
  def show
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to users_url
    else
      render :action => :edit
    end
  end
  
  private
  
  def find_user
    @user = User.find_by_id params[:id]
  end
end
