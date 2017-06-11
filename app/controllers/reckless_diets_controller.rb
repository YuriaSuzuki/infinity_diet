class RecklessDietsController < ApplicationController
  def top; end

  def show
    @plan = CalculateFromBmi.new(bmi).call
  end

  private

  def bmi
    params[:weight] / params[:height] ** 2
  end
end
