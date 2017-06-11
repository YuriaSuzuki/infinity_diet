class RecklessDietsController < ApplicationController
  def top; end

  def result
    @plan = BmiService::CalculatePlanFromBmi.new(bmi, params[:ideal_bmi]).call
    @name = params[:name]
  end

  private

  def bmi
    params[:weight].to_i / params[:height].to_i ** 2
  end
end
