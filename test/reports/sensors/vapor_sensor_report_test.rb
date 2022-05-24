# frozen_string_literal: true

require "test_helper"

class VaporSensorReportTest < Minitest::Test
  def test_vapor_sensor_report
    entries = report_response(Atg::VaporSensorReport)

    assert_equal 8, entries.size

    first_entry = entries[0]
    assert_equal "01", first_entry.number
    assert_equal "STP SUMP NL", first_entry.label

    entries[1..7].each.with_index(2) do |entry, index|
      assert_equal "0#{index}", entry.number
      assert_equal "", entry.label
    end
  end
end
