class UsersController < ApplicationController
def my_friends
# @followers=current_user.followers
# @followings=current_user.followings

  render("my_friends.html.erb")
end

  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @case = Case.new

    render("users/show.html.erb")
  end
end
