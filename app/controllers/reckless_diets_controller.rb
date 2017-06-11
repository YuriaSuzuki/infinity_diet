class RecklessDietsController < ApplicationController
  def top; end

  def result
    @plans = BmiService::CalculatePlanFromBmi.call(weight: params[:weight], ideal_weight: params[:ideal_weight])
    @name = params[:name]
    @weight_diff = params[:weight].to_i - params[:ideal_weight].to_i
  end
end
