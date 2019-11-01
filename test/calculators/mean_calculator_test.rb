require 'test_helper'

class MeanCalculatorTest < ActiveSupport::TestCase
  test "should load the calculator" do
    assert MeanCalculator.new(list: [])
  end

  test "should return 0.0 if list empty" do
    mean = MeanCalculator.calculate(list: [])

    assert_equal(mean, 0.0)
  end

  test "should return 0.0 if list nil" do
    mean = MeanCalculator.calculate(list: nil)

    assert_equal(mean, 0.0)
  end

  test "should calculate mean of all readings" do
    mean = MeanCalculator.calculate(
      list: Reading.pluck(:value)
    )

    assert_equal(mean, 6.0)
  end
end
