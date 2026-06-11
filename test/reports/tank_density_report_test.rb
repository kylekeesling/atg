# frozen_string_literal: true

require "test_helper"

class TankDensityReportTest < Minitest::Test
  def test_tank_density_report
    entries = report_response(Atg::TankDensityReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 5.9987, entries[0].density, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 5.9987, entries[1].density, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 5.9987, entries[2].density, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 5.9987, entries[3].density, 0.01
  end
end
