module MessageHelper

    def chatWith msg
        messages = []
        msg.each do |message|
             if message.reciever_id === "user"
                username = User.find_by(id: message.reciever_id)
                if username
                    messages << {name: username.name, table_id: message.table_id}
                end
             else
                username = Mechanic.find_by(id: message.reciever_id)
                if username
                    messages << {name:username.name, table_id: message.table_id}
                end
             end
        end

        return messages
    end 
end
