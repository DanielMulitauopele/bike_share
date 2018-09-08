class UsersController < ApplicationController
  
  def dashboard
    @user = User.find(current_user.id)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.email.downcase!
    if @user.save
      session[:user_id] = @user.id 
      redirect_to dashboard_path
      flash[:notice] = "Successfully created account for #{@user.name}!"
    else
      flash[:alert] = 'Oops, could not create account. Please use a valid email and password and try again.'
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
