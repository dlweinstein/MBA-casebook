class UsersController < ApplicationController
def my_friends

  render("my_friends.html.erb")
end

  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @case = Case.new
    @message = Message.new

    render("users/show.html.erb")
  end
end
