class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = @chatroom.messages.new(message_params.merge(user_id: current_user.id))
    # merge ensures the sender is the current user
    # the method merge is used to add a key-value pairs in the message_params hash.
    puts "current_user : #{current_user.first_name}"
    puts "message.sender : #{@message.sender.first_name}"
    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
            target: "messages",
            locals: { message: @message, user: current_user })
        end
        format.html { redirect_to chatroom_path(@chatroom) }
      end
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
