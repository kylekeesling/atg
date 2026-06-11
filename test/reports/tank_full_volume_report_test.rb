# frozen_string_literal: true

require "test_helper"

class TankFullVolumeReportTest < Minitest::Test
  def test_tank_full_volume_report
    entries = report_response(Atg::TankFullVolumeReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 8021.0, entries[0].full_volume, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 8021.0, entries[1].full_volume, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 10027.0, entries[2].full_volume, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 4000.0, entries[3].full_volume, 0.01
  end
end
