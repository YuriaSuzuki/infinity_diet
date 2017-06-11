class RecklessDietsController < ApplicationController
  def top; end

  def result
    @plan = BmiService::CalculatePlanFromBmi.call(params[:weight], params[:ideal_weight])
    @name = params[:name]
  end
end
