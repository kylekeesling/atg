# frozen_string_literal: true

require "test_helper"

class TwoWireSensorStatusReportTest < Minitest::Test
  def test_two_wire_sensor_status_report
    entries = report_response(Atg::TwoWireSensorStatusReport)

    assert_equal 1, entries.size

    first_entry = entries[0]
    assert_equal "01", first_entry.sensor_number
    assert_equal "0000", first_entry.sensor_status_value
    assert_equal "Sensor Normal", first_entry.status
  end
end
