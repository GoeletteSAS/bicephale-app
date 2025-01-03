class MessagesController < ApplicationController
  def create
    @binome = Binome.find(params[:binome_id])
    @message = @binome.messages.new(message_params.merge(user_id: current_user.id))
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
        self.message_mail_notification
        format.html { redirect_to chatroom_path(@binome), notice: "email de confirmation envoyé !" }

      end
    else
      render "binomes/show", status: :unprocessable_entity
    end
  end

  def message_mail_notification
    @user = current_user
    UserMailer.with(user: @user).welcome_email(@user).deliver_later
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
