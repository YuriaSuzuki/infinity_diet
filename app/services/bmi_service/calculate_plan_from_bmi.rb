module BmiService
  class CalculatePlanFromBmi
    include ServiceBase

    def call
      plan = \
        if bmi > 30
          Plan::ID::EVEREST
        elsif bmi > 25
          Plan::ID::BDP
        elsif bmi > 22
          Plan::ID::DC
        elsif bmi > 18
          Plan::ID::NOTHING
        else
          Plan::ID::EAT
        end
    end

    private

    attr_accessor :bmi

  end
end