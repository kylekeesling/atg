# frozen_string_literal: true

require "test_helper"

class LiquidSensorTypeReportTest < Minitest::Test
  def test_liquid_sensor_type_report
    entries = report_response(Atg::LiquidSensorTypeReport)

    assert_equal 8, entries.size
    assert_equal "01", entries[0].number
    entries.each { |e| assert_equal :tri_state, e.sensor_type }
  end
end
