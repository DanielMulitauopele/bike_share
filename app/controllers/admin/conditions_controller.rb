class Admin::ConditionsController < Admin::BaseController
  def destroy
    condition = Condition.find(params[:id])
    Condition.destroy(condition.id)
    flash[:notice] = "Successfully deleted #{condition.date}"
    redirect_to conditions_path
  end
end
