class ConditionsController < ApplicationController
  def index
    @conditions = Condition.all
  end

  def show

  end
end
