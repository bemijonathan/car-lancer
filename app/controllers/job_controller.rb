class JobController < ApplicationController
    before_action :authenticate

    def all
      @work = Work.all().limit(10)
    end

    def newbid
      a = Bidding.new(work_id:params[:id], mechanic_id: @current_user.id, amount:params[:amount], description:params[:description])
      if a.save
        flash[:notice] = "added successfully"
        redirect_to "/job/#{params[:id]}"
      else
        flash[:notice] = "unable to save"
        redirect_to "/job/#{params[:id]}"
      end
    end

    def mypost
      @work = Work.where(user_id: @current_user.id)
    end
  
    def show
      @work = Work.find(params[:id])
      @biddings = @work.biddings
    end
  
    def create
      @work = Work.new(params_expected)
      @work.user_id = @current_user.id
      if @work.save
        ActionCable.server.broadcast(
          "notifications_channel",
          posted_by: "#{@work.user.name}",
          title: "#{@work.title}"
        )
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
