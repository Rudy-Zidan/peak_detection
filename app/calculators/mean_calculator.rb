class MeanCalculator < ApplicationCalculator
  def initialize(list:)
    @list = list
  end

  def calculate
    return 0.0 if @list.nil? || @list.empty?

    (@list.reduce(&:+) / @list.size.to_f).round(2)
  end
end
