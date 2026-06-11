# frozen_string_literal: true

require "test_helper"

class TankLeakAlarmLimitReportTest < Minitest::Test
  def test_tank_leak_alarm_limit_report
    entries = report_response(Atg::TankLeakAlarmLimitReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 99.0, entries[0].leak_alarm_limit, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 99.0, entries[1].leak_alarm_limit, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 99.0, entries[2].leak_alarm_limit, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 99.0, entries[3].leak_alarm_limit, 0.01
  end
end
