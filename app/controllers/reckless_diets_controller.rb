class RecklessDietsController < ApplicationController
  def top; end

  def result
    @plan = BmiService::CalculatePlanFromBmi.new(bmi, params[:ideal_bmi]).call
    @name = params[:name]
  end

  private

  def bmi
    params[:weight] / params[:height] ** 2
  end
end
