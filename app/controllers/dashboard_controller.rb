class DashboardController < ApplicationController
  before_action :authenticate

  def dashboard
    if @current_user.class.table_name === "users"
      @myPost = @current_user.works
    else
      @myPost = @current_user.biddings
    end
    # @myPost = @current_user.works

    @job =  Work.all().limit(10)
    @mechanics = Mechanic.all.limit(10)
    
  end
end
