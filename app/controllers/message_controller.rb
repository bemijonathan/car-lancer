class MessageController < ApplicationController
    def index
        @message = Message.where(sender_id:"1")
        @m = Message.all.count
    end


    def show 
    end


    def create
    end

end
