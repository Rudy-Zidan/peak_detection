class StandardDeviationCalculator < ApplicationCalculator
  def initialize(list:, mean:)
    @list = list
    @mean = mean
  end

  def calculate
    return 0.0 if @list.nil? || @list.empty? || @mean.nil?

    result = @list.reduce(0.0) do |acc, value|
      acc.to_f + ((value.to_f - @mean) ** 2)
    end

    Math.sqrt(result / @list.size.to_f).round(2)
  end
end
