# frozen_string_literal: true

require "test_helper"

class TankLeakTestResultsReportTest < Minitest::Test
  def test_tank_leak_test_results_report
    entries = report_response(Atg::TankLeakTestResultsReport)

    assert_equal 3, entries.size

    first_entry = entries[0]
    assert_equal "01", first_entry.tank_number
    assert_equal "01", first_entry.result_type_code
    assert_equal "0.1 gal/hr Test", first_entry.result_type
    assert_equal "Test Invalid", first_entry.result
    assert_equal "00", first_entry.manifold_status_code
    assert_equal "Tank Not Manifolded During Leak Test", first_entry.manifold_status
    assert_equal DateTime.new(2022, 5, 30, 0, 0), first_entry.started_at
    assert_equal 0.1167805939912796, first_entry.test_rate
    assert_equal 2.0, first_entry.duration_hours
    assert_equal 836.0810546875, first_entry.volume

    second_entry = entries[1]
    assert_equal "01", second_entry.tank_number
    assert_equal "00", second_entry.result_type_code
    assert_equal "0.2 gal/hr Test", second_entry.result_type
    assert_equal "Test Invalid", second_entry.result
    assert_equal "00", second_entry.manifold_status_code
    assert_equal "Tank Not Manifolded During Leak Test", second_entry.manifold_status
    assert_equal DateTime.new(2022, 5, 30, 0, 0), second_entry.started_at
    assert_equal 0.1167805939912796, second_entry.test_rate
    assert_equal 2.0, second_entry.duration_hours
    assert_equal 836.0810546875, second_entry.volume

    third_entry = entries[2]
    assert_equal "01", third_entry.tank_number
    assert_equal "02", third_entry.result_type_code
    assert_equal "Gross (3 gal/hr) Test", third_entry.result_type
    assert_equal "Test Passed", third_entry.result
    assert_equal "00", third_entry.manifold_status_code
    assert_equal "Tank Not Manifolded During Leak Test", third_entry.manifold_status
    assert_equal DateTime.new(2022, 5, 30, 0, 0), third_entry.started_at
    assert_equal 0.1339111328125, third_entry.test_rate
    assert_equal 0.5, third_entry.duration_hours
    assert_equal 836.0810546875, third_entry.volume
  end
end
