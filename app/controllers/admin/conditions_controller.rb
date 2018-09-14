class Admin::ConditionsController < Admin::BaseController
  def destroy
    condition = Condition.find(params[:id])
    Condition.destroy(condition.id)
    flash[:notice] = "Successfully deleted #{condition.date}"
    redirect_to conditions_path
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.update(condition_params)
    redirect_to condition_path(@condition)
  end

  private
  def condition_params
    params.require(:condition).permit(:date, :max_temperature, :mean_temperature,
                                      :min_temperature, :mean_humidity,
                                      :mean_visibility, :mean_wind_speed,
                                      :precipitation)
  end
end
