class DashboardController < ApplicationController
  before_action :authenticate

  def dashboard
    @myPost = @current_user.works
    
  end
end
