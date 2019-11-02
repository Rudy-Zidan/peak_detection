require 'test_helper'

class ZScoreCalculatorTest < ActiveSupport::TestCase
  test "should load the calculator" do
    assert ZScoreCalculator.new(list: [])
  end

  test "should return [] if list empty" do
    z_scores = ZScoreCalculator.calculate(list: [])

    assert_equal(z_scores, [])
  end

  test "should return [] if list nil" do
    z_scores = ZScoreCalculator.calculate(list: nil)

    assert_equal(z_scores, [])
  end

  test "should calculate zscores of all readings" do
    data = Reading.pluck(:value)
    zscores = ZScoreCalculator.calculate(list: data)

    assert_equal(zscores, [0.37, -0.48, -0.77, 1.79, -0.91])
  end
end
