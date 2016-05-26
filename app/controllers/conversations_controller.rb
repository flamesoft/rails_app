class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    if conversation_params[:subject].empty? then
      show_error 'Your message must have a subject'
    elsif conversation_params[:body].empty? then
      show_error 'Your message cannot be empty'
    else
      recipients = User.where(id: conversation_params[:recipients])
      if recipients.empty? then
          show_error 'Your recipients cannot be empty'
      else
        conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
        flash[:success] = 'Your message was successfully sent!'
        redirect_to conversation_path(conversation)
      end
    end
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    if message_params[:body].empty? then
      show_error 'Your message cannot be empty'
    elsif current_user.reply_to_conversation(conversation, message_params[:body])
      flash[:notice] = 'Your reply message was successfully sent!'
      redirect_to conversation_path(conversation)
    end
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body, recipients: [])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end

  def show_error(message)
    flash[:error] = message
    redirect_to new_conversation_path
  end

end
