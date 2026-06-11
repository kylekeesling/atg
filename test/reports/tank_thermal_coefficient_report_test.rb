# frozen_string_literal: true

require "test_helper"

class TankThermalCoefficientReportTest < Minitest::Test
  def test_tank_thermal_coefficient_report
    entries = report_response(Atg::TankThermalCoefficientReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 0.0007, entries[0].thermal_coefficient, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 0.0007, entries[1].thermal_coefficient, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 0.0007, entries[2].thermal_coefficient, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 0.0007, entries[3].thermal_coefficient, 0.01
  end
end
