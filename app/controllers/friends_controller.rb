class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def show
    @friend = Friend.find(params[:id])

    render("friends/show.html.erb")
  end

  def new
    @friend = Friend.new

    render("friends/new.html.erb")
  end

  def create
    @friend = Friend.new

    @friend.sender_id = params[:sender_id]
    @friend.recipient_id = params[:recipient_id]

    if @friend.save
      redirect_to :back, :notice => "Friend request sent successfully."
    else
      render 'new'
    end
  end

  def edit
    @friend = Friend.find(params[:id])

    render("friends/edit.html.erb")
  end

  def update
    @friend = Friend.find(params[:id])

    @friend.sender_id = params[:sender_id]
    @friend.recipient_id = params[:recipient_id]

    save_status = @friend.save

    if save_status == true
      redirect_to("/friends/#{@friend.id}", :notice => "Friend updated successfully.")
    else
      render("friends/edit.html.erb")
    end
  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy

    if URI(request.referer).path == "/friends/#{@friend.id}"
      redirect_to("/", :notice => "Friend deleted.")
    else
      redirect_to(:back, :notice => "Friend deleted.")
    end
  end
end
