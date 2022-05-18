# frozen_string_literal: true

require "test_helper"

class PriorityAlarmHistoryReportTest < Minitest::Test
  def test_alarm_history_report
    entries = report_response(Atg::PriorityAlarmHistoryReport)

    assert_equal 13, entries.size

    first_entry = entries[0]
    assert_equal "02", first_entry.alarm_category_code
    assert_equal "00", first_entry.sensor_category_code
    assert_equal "03", first_entry.alarm_type_number
    assert_equal "01", first_entry.tank_sensor_number
    assert_equal "02", first_entry.alarm_state_code
    assert_equal DateTime.new(2022, 5, 9, 13, 13), first_entry.occurred_at
    assert_equal "Tank Alarm", first_entry.category
    assert_equal "Tank High Water Alarm", first_entry.type
    assert_equal "Open", first_entry.state
    assert_equal "Other", first_entry.sensor_category

    last_entry = entries.last
    assert_equal "01", last_entry.alarm_category_code
    assert_equal "00", last_entry.sensor_category_code
    assert_equal "04", last_entry.alarm_type_number
    assert_equal "01", last_entry.tank_sensor_number
    assert_equal "02", last_entry.alarm_state_code
    assert_equal DateTime.new(2009, 7, 1, 8, 0), last_entry.occurred_at
    assert_equal "System Alarm", last_entry.category
    assert_equal "Battery Off", last_entry.type
    assert_equal "Open", last_entry.state
    assert_equal "Other", last_entry.sensor_category
  end
end
