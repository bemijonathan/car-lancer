class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
    end
    def show
        if @current_user.class.table_name === "users"
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

        elsif @current_user.class.table_name === "mechanics"
            @user = User.find_by(id: params[:id])
            @convo = Conversation.find_by(user__id: @user.id, mechanic__id: @current_user.id)
            if !@convo.present?
                @convo = @user.conversation.create(user__id: @user.id, mechanic__id:@current_user.id)
                @convo.save
                @conversation = @convo.messages
            else
                @convo
            end
            @Conversation = @convo.messages
        end
    end

    def create
        id = params[:id]
        sender_class = @current_user.class.table_name
        content = params[:body]
        @messages = Message.new(conversation_id: id, sender_class: sender_class, body: content )
        reciever = nil
        if sender_class === "users"
            reciever = @messages.conversation.mechanic__id
        else
            reciever = @messages.conversation.user__id
        end
        
        if @messages.save
            data = {
                from: "#{@current_user.name}",
                body: "#{@messages.body}"
            }
            ActionCable.server.broadcast "chat_channel:#{reciever}" , data
        end
    end
end

