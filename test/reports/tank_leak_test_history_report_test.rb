# frozen_string_literal: true

require "test_helper"

class TankLeakTestHistoryReportTest < Minitest::Test
  def test_tank_inventory_report
    entries = report_response(Atg::TankLeakTestHistoryReport)

    assert_equal 1, entries.size

    first_entry = entries[0]
    assert_equal "01", first_entry.tank_number
    assert_equal 1, first_entry.results_to_follow
    assert_equal "00", first_entry.leak_report_type_number
    assert_equal "01", first_entry.leak_history_number
    assert_equal "02", first_entry.leak_test_type_number
    assert_equal DateTime.new(2022, 5, 9, 0, 0), first_entry.started_at
    assert_equal 0.0, first_entry.duration_hours
    assert_equal 1173.0279541015625, first_entry.volume
    assert_equal 58.651397705078125, first_entry.percentage_full
  end
end
