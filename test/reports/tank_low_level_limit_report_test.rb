# frozen_string_literal: true

require "test_helper"

class TankLowLevelLimitReportTest < Minitest::Test
  def test_tank_low_level_limit_report
    entries = report_response(Atg::TankLowLevelLimitReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 1000.0, entries[0].low_level_limit, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 1000.0, entries[1].low_level_limit, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 1000.0, entries[2].low_level_limit, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 600.0, entries[3].low_level_limit, 0.01
  end
end
