# frozen_string_literal: true

require "test_helper"

class TankOverfillLimitReportTest < Minitest::Test
  def test_tank_overfill_limit_report
    entries = report_response(Atg::TankOverfillLimitReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 7218.9722, entries[0].overfill_limit, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 7218.9722, entries[1].overfill_limit, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 9024.3906, entries[2].overfill_limit, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 3600.0359, entries[3].overfill_limit, 0.01
  end
end
