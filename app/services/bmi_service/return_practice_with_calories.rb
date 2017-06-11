module BmiService
  class ReturnPracticeWithCalories
    include ServiceBase

    def call
      {
          '指パッチン': 34,
          'タイピング': 45,
          '貧乏ゆすり': 87,
          '指相撲': 55,
          'ペットボトルのキャップ開閉': 32,
          'カラオケ': 102,
          'みかんの皮をむく': 37,
          'ゴミ拾いを全力でする': 120,
          'lineを全力でする': 21,
          '睡眠': 5
      }
    end
  end
end

