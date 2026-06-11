# frozen_string_literal: true

require "test_helper"

class TankHighLevelLimitReportTest < Minitest::Test
  def test_tank_high_level_limit_report
    entries = report_response(Atg::TankHighLevelLimitReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 7620.0264, entries[0].high_level_limit, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 7620.0264, entries[1].high_level_limit, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 9525.7451, entries[2].high_level_limit, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 3800.0381, entries[3].high_level_limit, 0.01
  end
end
