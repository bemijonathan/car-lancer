class JobController < ApplicationController
    before_action :authenticate

    def index
      @work = Work.all().limit(10)
    end
  
    def show
      @work = Work.find(params[:id])
    end
  
    def create
      @work = Work.new(params_expected)
      @work.user_id = @current_user.id
      if @work.save
        flash[:notice] = "saved"
        redirect_to '/'
      else
        flash[:notice] = @work.errors
        render "job/index"
      end
    end
  
    def update
      @work = Work.find(params[:id])
    end
  
    def edit
      @work = Work.find(params[:id])
    end
  
    def destroy
      @work = Work.find(params[:id])
    end

    private

    def params_expected
      params.permit(:title, :description, :amount,  :location)
    end
end
