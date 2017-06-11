module BmiService
  class CalculatePlanFromBmi
    include ServiceBase
    attr_accessor :weight, :ideal_weight

    CALORIE_PER_WEIGHT = 7500

    def call
      plan = {}
      practices.each do |key, _|
        plan[key] = 0
      end
      left_calorie = calorie_from_weight
      while (left_calorie > 0)
        practice = practices.keys[rand(practices.count())]
        plan[practice] += 1
        left_calorie -= practices[practice]
      end

      plan.reject { |key, value| value == 0 }
    end

    private

    def calorie_from_weight
      (weight.to_i - ideal_weight.to_i) * CALORIE_PER_WEIGHT
    end

    def practices
      practices ||= BmiService::ReturnPracticeWithCalories.call
    end
  end
end
