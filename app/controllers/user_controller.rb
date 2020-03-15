class UserController < ApplicationController
      
  def index
    
  end
  
  def show
  end
  
  def create
    @user =  User.new(post_params)
    if @user.save
        flash[:notice] = "succesfully created an account"
    else
        flash[:notice] = @user.errors.messages
        render 'application/signup'
    end
  end
  
  def edit
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  private

  def post_params
    params.permit(:name, :email, :password)
  end

end
