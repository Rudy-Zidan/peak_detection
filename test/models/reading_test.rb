require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  test "should get value of the first record equal to 10.5" do
    assert_equal(readings(:one).value, 10.5)
  end
end
