class UserController < ApplicationController
      
  # def index
    
  # end
  
  def show
    @user = User.find(params[:id])
  end
  
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

  def signin
    @user = User.find_by(email: params[:email])
    if @user != nil
      if @user.password === params[:password]
        flash[:notice] = "welcome back"
        session[:user_id] = @user.id
        session[:email] = @user.email
        redirect_to '/'
      else
          flash[:notice] = @user.errors.messages
          render 'application/login'
      end
    else
      flash[:notice] = "incorrect user details"
    end

    
  end

  def login
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.update(post_params)
    if @user.save
      flash[:notice] = "Settings saved succesfully"
      redirect_to "/user/#{params[:id]}"
    else
      flash[:notice] = "Failed to save"
      render 'user/edit'
    end
  end
  
  # def destroy
    
  # end
  
  private

  def post_params
    params.permit(:name, :email, :password)
  end

end
