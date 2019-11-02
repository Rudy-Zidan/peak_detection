require 'test_helper'

class PeaksControllerTest < ActionDispatch::IntegrationTest
  test "get signals by threshold" do
    params = {threshold: 1.5}
    get peaks_path(params)

    assert_response :success
    body = JSON.parse(response.body)

    assert body['signals']
    assert_equal(body['signals'].size, 5)
    assert_equal(body['signals'], [0, 0, 0, 1, 0])
  end

  test "get signals by date and threshold" do
    Time.stubs(:now).returns(Time.parse('2019-11-1 00:00'))

    params = {
      threshold: 1.5,
      date_range: {
        start_date: '31/10/2019',
        end_date: '02/11/2019'
      }
    }

    get peaks_path(params)

    assert_response :success
    body = JSON.parse(response.body)

    assert body['signals']
    assert_equal(body['signals'].size, 5)
    assert_equal(body['signals'], [0, 0, 0, 1, 0])
  end
end
