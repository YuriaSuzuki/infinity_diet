module BmiService
  class CalculatePlanFromBmi
    include ServiceBase
    attr_accessor :weight, :ideal_weight

    CALORIE_PER_WEIGHT = 7500
    PLAN_NUM = 3

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
      all_practices ||= BmiService::ReturnPracticeWithCalories.call
      practices = {}
      practice_nums = (0..all_practices.count()-1).to_a.sample(PLAN_NUM)
      all_practices.each_with_index do |key, value, i|
        practices[key] = value if practice_nums.include?(i)
      end
      practices
    end
  end
end
