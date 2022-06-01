# frozen_string_literal: true

require "test_helper"

class TankLeakTestHistoryReportTest < Minitest::Test
  def test_tank_inventory_report
    entries = report_response(Atg::TankLeakTestHistoryReport)

    assert_equal 1, entries.size

    first_entry = entries[0]
    assert_equal "01", first_entry.tank_number
    assert_equal "00", first_entry.report_type_code
    assert_equal "Last Test Passed", first_entry.report_type
    assert_equal "01", first_entry.leak_history_number
    assert_equal "02", first_entry.test_type_code
    assert_equal "Gross (3 gal/hr) Test", first_entry.test_type
    assert_equal DateTime.new(2022, 5, 30, 0, 0), first_entry.started_at
    assert_equal 0.0, first_entry.duration_hours
    assert_equal 836.0810546875, first_entry.volume
    assert_equal 41.80405044555664, first_entry.percentage_full
  end
end
