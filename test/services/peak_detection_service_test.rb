require 'test_helper'

class PeakDetectionServiceTest < ActiveSupport::TestCase
  test "should load the service" do
    assert PeakDetectionService.new(data: [], threshold: 2.0)
  end

  test "should return [] if z_scores empty" do
    z_scores = PeakDetectionService.run(data: [], threshold: 2.0)

    assert_equal(z_scores, [])
  end

  test "should return [] if z_scores nil" do
    z_scores = PeakDetectionService.run(data: nil, threshold: 2.0)

    assert_equal(z_scores, [])
  end

  test "should get peaks of all readings" do
    data = Reading.pluck(:value)
    signals = PeakDetectionService.run(data: data, threshold: 1.5)

    assert_equal(signals, [0, 0, 0, 1, 0])
  end
end
