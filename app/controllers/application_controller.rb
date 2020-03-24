class ApplicationController < ActionController::Base

  before_action :current_user

  def belongs_to_user (details)
    if @current_user != nil and @current_user.email === details.email and  @current_user.id === details.id
      return true
    else
      return false
    end
  end

  def index
  end

  def signup
    if logged_in
      redirect_to '/'
    end
  end

  def about
  end

  def logout
    session[:user_id] = nil
    session[:email] = nil
    redirect_to '/'
  end

  def login
    if logged_in
      render '/'
    else
      render 'user/login'
    end
  end

  def search
    @name = params[:search]
    # render "application/search"
  end

  # private
  def current_user
    if session[:user_id]
      @current_user = User.find_by(email: session[:email]) || Mechanic.find_by(email: session[:email]) 
    end
  end

  def authenticate
    if @current_user == nil
      flash[:notice] = "you have to login"
      redirect_to '/login'
    end
  end

  def logged_in
    if @current_user
      flash[:notice] = "you are logged in already"
      return true
    end
  end
end
