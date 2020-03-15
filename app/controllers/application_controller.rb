class ApplicationController < ActionController::Base
  def index
  end

  def about
  end

  def login
  end

  def search
    @name = params[:search]
    # render "application/search"
  end
end
