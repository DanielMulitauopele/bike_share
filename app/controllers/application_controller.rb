class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :number_to_currency

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def number_to_currency(number)
    ('$%.2f' % number).to_s
  end
end
