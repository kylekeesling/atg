# frozen_string_literal: true

require "test_helper"

class TankDiameterReportTest < Minitest::Test
  def test_tank_diameter_report
    entries = report_response(Atg::TankDiameterReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 96.0, entries[0].diameter, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 96.0, entries[1].diameter, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 96.0, entries[2].diameter, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 64.0, entries[3].diameter, 0.01
  end
end
