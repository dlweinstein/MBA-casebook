class MessagesController < ApplicationController
  def index
    @messages = Message.all

    render("messages/index.html.erb")
  end

  def show
    @message = Message.find(params[:id])

    render("messages/show.html.erb")
  end

  def new
    @message = Message.new

    render("messages/new.html.erb")
  end

  def create
    @message = Message.new

    @message.sender_id = params[:sender_id]
    @message.receiver_id = params[:receiver_id]
    @message.body = params[:body]

    if @message.save
      redirect_to :back, :notice => "Message sent successfully."
    else
      render 'new'
    end
  end

  def edit
    @message = Message.find(params[:id])

    render("messages/edit.html.erb")
  end

  def update
    @message = Message.find(params[:id])

    @message.sender_id = params[:sender_id]
    @message.receiver_id = params[:receiver_id]
    @message.body = params[:body]

    if @message.save
        redirect_to "/messages", :notice => "Message updated successfully."
      else
        render 'edit'
      end
  end

  def destroy
    @message = Message.find(params[:id])

    @message.destroy

      redirect_to :back, :notice => "Message deleted."
  end
end
