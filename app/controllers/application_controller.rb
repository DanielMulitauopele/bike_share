class ApplicationController < ActionController::Base
  before_action :set_cart

  protect_from_forgery with: :exception
  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  helper_method :current_user, :current_admin?
  helper_method :current_user?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_admin?
    current_user && current_user.admin?
  end

  def current_user?
    current_user
  end
end
