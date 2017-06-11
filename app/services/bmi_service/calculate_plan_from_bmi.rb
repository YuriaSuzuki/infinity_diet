module BmiService
  class CalculatePlanFromBmi
    include ServiceBase
    attr_accessor :weight, :ideal_weight

    CALORIE_PER_WEIGHT = 7500

    def initialize(weight, ideal_weight)
      @weight = weight.to_i
      @ideal_weight = ideal_weight.to_i
    end

    def call
      plan = {}
      practices.each do |key, _|
        plan[key] = 0
      end
      left_calorie = calorie_from_weight
      while (left_calorie > 0)
        practice_id = rand(practices.count())
        ++plan[practice_id]
        left_calorie - practices[practice_id]
      end

      return plan.reject { |key, value| value == 0 }
    end

    private

    def calorie_from_weight
      (@ideal_weight - @weight) * CALORIE_PER_WEIGHT
    end

    def practices
      practices ||= BmiService::ReturnPracticeWithCalories.call
    end
  end
end
