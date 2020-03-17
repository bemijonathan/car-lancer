class UserController < ApplicationController
      
  # def index
    
  # end
  
  # def show
  # end
  
  def create
    @user =  User.new(post_params)
    if @user.save
        flash[:notice] = "succesfully created an account"
        session[:user_id] = @user.id
        session[:email] = @user.email
        redirect_to '/'
    else
        flash[:notice] = @user.errors.messages
        render 'application/signup'
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user.password === params[:password]
        flash[:notice] = "welcome back"
        session[:user_id] = @user.id
        session[:email] = @user.email
        redirect_to '/'
    else
        flash[:notice] = @user.errors.messages
        render 'application/login'
    end
  end
  
  # def edit
  # end
  
  # def update
    
  # end
  
  # def destroy
    
  # end
  
  private

  def post_params
    params.permit(:name, :email, :password)
  end

end
