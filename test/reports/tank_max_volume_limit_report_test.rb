# frozen_string_literal: true

require "test_helper"

class TankMaxVolumeLimitReportTest < Minitest::Test
  def test_tank_max_volume_limit_report
    entries = report_response(Atg::TankMaxVolumeLimitReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 8021.0, entries[0].max_volume_limit, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 8021.0, entries[1].max_volume_limit, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 10027.0, entries[2].max_volume_limit, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 4000.0, entries[3].max_volume_limit, 0.01
  end
end
