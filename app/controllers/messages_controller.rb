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
    @message.save
    ConversationChannel.broadcast_to(
      @conversation,
      render_to_string(partial: "messages/message", locals: { message: @message }, sender_id: @message.account.id)
    )
    head :ok
  end

  private

  def message_params
    params.require(:message).permit(:body, :account_id)
  end
end
