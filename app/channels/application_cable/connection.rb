# ApplicationController
# require_relative "../../controllers/application_controller"

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      current =  User.find_by(email: cookies[:email]) || Mechanic.find_by(email: cookies[:email]) 
      if current === nil
        reject_unauthorized_connection
      else
        self.current_user = current
      end
    end
  end
end
