class UsersController < ApplicationController
 before_action :set_user, only: [:dashboard, :edit, :update]

  def dashboard
    @orders = @user.orders
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

  def edit
    if current_user.id.to_s != params[:id]
      render file: "/public/404"
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      flash[:success] = "#{@user.name} profile updated."
      redirect_to dashboard_path
    else
      flash[:failure] = "Please fill in all fields to update user profile."
      redirect_to edit_user_path(@user)
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
