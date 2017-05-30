class UsersController < ApplicationController
  def index
    @users = User.all

    render("users/index.html.erb")
  end

  def show
    @user = User.find(params[:id])
    @case = Case.new

    render("users/show.html.erb")
  end

  def myfavorites
    render("/users/my_favorites.html.erb")
    end

end
