class MechanicController < ApplicationController

        
  def index
    
  end
  
  def show
  end
  
  def create
    @mechanic =  Mechanic.new(post_params)
    if @mechanic.save
        session[:user_id] = @mechanic.id
        session[:email] = @mechanic.email
        flash[:notice] = "succesfully created an account"
        redirect_to '/'
    else
        flash[:notice] = @mechanic.errors.messages
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
    params.permit(:name, :email, :password , :phone, :bussinessname)
  end

end
