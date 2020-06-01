class MechanicController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :belongs_to_user  only: [:edit, :update, :destroy]
        
  def index
    @mechanic = Mechanic.all
  end
  
  def show
    @mechanic = Mechanic.find(params[:id])
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
        redirect_to '/login'
    end
  end

  def signin
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
      render "mechanic/login"
    end
  end

  def login
  end
  
  def edit
    @mechanic = Mechanic.find_by(id: params[:id])
  end
  
  def update
    @mechanic = Mechanic.find_by(id: params[:id])
    @mechanic.update(post_params)
    if @mechanic.save
      flash[:notice] = "Settings saved succesfully"
      redirect_to "/mechanic/#{params[:id]}"
    else
      flash[:notice] = "Failed to save"
      render 'mechanic/edit'
    end
  end
  
  # def destroy
  #   @mechanic = Mechanic.find_by(id: params[:id])
    
  # end
  
  private

  def post_params
    params.permit(:name, :email, :password , :phone, :bussinessname)
  end

end
