class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    @message = Message.new(params[conversation: @conversation])
  end

  def new
    @message = Message.new(params[conversation: @conversation])
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      ConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: "messages/message", locals: { message: @message })
      )
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :account_id)
  end
end
