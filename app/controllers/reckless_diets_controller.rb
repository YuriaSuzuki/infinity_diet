class RecklessDietsController < ApplicationController
  def top; end

  def result
    @plan = BmiService::CalculatePlanFromBmi.new(bmi).call
  end

  private

  def bmi
    params[:weight] / params[:height] ** 2
  end
end
