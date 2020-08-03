class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @user_name = @user.first_name + ' ' + @user.last_name
  end
end
