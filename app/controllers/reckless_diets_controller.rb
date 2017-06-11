class RecklessDietsController < ApplicationController
  def top; end

  def result
    @plan = BmiService::CalculatePlanFromBmi.new(params[:weight], params[:ideal_weight]).call
    @name = params[:name]
  end
end
