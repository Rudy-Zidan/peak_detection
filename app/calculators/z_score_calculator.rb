class ZScoreCalculator < ApplicationCalculator
  def initialize(list:)
    @list = list
  end

  def calculate
    return [] if @list.nil? || @list.empty?

    mean = MeanCalculator.calculate(list: @list)
    stddv = StandardDeviationCalculator.calculate(list: @list, mean: mean)

    @list.map do |value|
      ((value - mean) / stddv).round(2)
    end
  end
end
