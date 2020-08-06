class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @user_name = @user.first_name + ' ' + @user.last_name
  end

  def new
    @user = User.new
    @cities = City.all.map {|c| [c.name, c.id]}
  end
end
