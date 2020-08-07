class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @user_name = @user.first_name + ' ' + @user.last_name
  end

  def new
    @user = User.new
    @cities = City.all.map { |c| [c.name, c.id] }
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :description, :age, :city_id, :password, :password_confirmation)
  end
end
