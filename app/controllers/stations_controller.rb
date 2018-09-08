class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end
end
