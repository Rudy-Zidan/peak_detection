require 'test_helper'

class StandardDeviationCalculatorTest < ActiveSupport::TestCase
  test "should load the calculator" do
    assert StandardDeviationCalculator.new(list: [], mean: nil)
  end

  test "should return 0.0 if list empty" do
    stddv = StandardDeviationCalculator.calculate(list: [], mean: nil)

    assert_equal(stddv, 0.0)
  end

  test "should return 0.0 if list nil" do
    stddv = StandardDeviationCalculator.calculate(list: nil, mean: nil)

    assert_equal(stddv, 0.0)
  end

  test "should calculate standard deviation of all readings" do
    data = Reading.pluck(:value)
    mean = MeanCalculator.calculate(list: data)
    stddv = StandardDeviationCalculator.calculate(list: data, mean: mean)
    
    assert_equal(stddv, 3.52)
  end
end
