class ApplicationController < ActionController::Base

  before_action :current_user

  def index
  end

  def signup
    logged_in
  end

  def about
  end

  def login
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

  def logged_in
    if @current_user
      flash[:notice] = "you are logged in already"
      redirect_to '/'
    else
      redirect_to 'login'
    end
  end
end
