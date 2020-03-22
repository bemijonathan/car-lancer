class MechanicController < ApplicationController
  skip_before_action :verify_authenticity_token
        
  def index
    @mechanic = Mechanic.all
  end
  
  # def show
  # end
  
  def create
    @mechanic =  Mechanic.new(post_params)
    if @mechanic.save
        session[:user_id] = @mechanic.id
        session[:email] = @mechanic.email
        flash[:notice] = "succesfully created an account"
        redirect_to '/'
    else
        flash[:notice] = @mechanic.errors.messages
        redirect_to '/login'
    end
  end

  def login
    @mechanic = Mechanic.find_by(email: params[:email])
    if @mechanic != nil
      if @mechanic.password === params[:password]
        flash[:notice] = "welcome back"
        session[:user_id] = @mechanic.id
        session[:email] = @mechanic.email
        redirect_to '/'
      else
          flash[:notice] = @mechanic.errors.messages
          render 'application/login'
      end
    else
      flash[:notice] = "incorrect details"
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
    params.permit(:name, :email, :password , :phone, :bussinessname)
  end

end
