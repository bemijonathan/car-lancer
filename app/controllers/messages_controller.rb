class MessagesController < ApplicationController
    def index
    end
    def show
        # if @current_user.class.table_name === "user"
            @mechanic = Mechanic.find_by(id: params[:id])
            @convo = Conversation.find_by(user__id: @current_user.id, mechanic__id: @mechanic.id)

            if !@convo.present?
                @convo = @current_user.conversation.create(user__id: @current_user.id, mechanic__id:@mechanic.id)
                @convo.save
                @conversation = @convo.messages
            else
                @convo
            end

            @Conversation = @convo.messages
        # elsif @current_user.class.table_name === "mechanic"
        #     @user = User.find_by(id: params[:id])
        #     @convo = Conversation.find_by(user__id: @user.id, mechanic__id: @current_user.id)
        #     if !@convo.present?
        #         @conversation = @convo.messages
        #     else
        #         @conversation = []
        #     end
        # end
    end

    def create
        id = params[:id]
        sender_class = @current_user.class.table_name
        content = params[:body]
        @messages = Message.new(conversation_id: id, sender_class: sender_class, body: content )
        if @messages.save
            redirect_to "/messages/#{id}"
        end
    end
end

