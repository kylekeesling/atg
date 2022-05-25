# frozen_string_literal: true

require "test_helper"

class ActiveAlarmReportTest < Minitest::Test
  def test_active_alarm_report
    entries = report_response(Atg::ActiveAlarmReport)

    assert_equal 2, entries.size

    first_entry = entries[0]
    assert_equal "02", first_entry.alarm_category_code
    assert_equal "00", first_entry.sensor_category_code
    assert_equal "03", first_entry.alarm_type_number
    assert_equal "01", first_entry.tank_sensor_number
    assert_equal DateTime.new(2022, 5, 9, 13, 13), first_entry.occurred_at
    assert_equal "Tank Alarm", first_entry.category
    assert_equal "Tank High Water Alarm", first_entry.type
    assert_equal "Other", first_entry.sensor_category

    second_entry = entries[1]
    assert_equal "02", second_entry.alarm_category_code
    assert_equal "00", second_entry.sensor_category_code
    assert_equal "10", second_entry.alarm_type_number
    assert_equal "01", second_entry.tank_sensor_number
    assert_equal DateTime.new(2022, 5, 9, 13, 13), second_entry.occurred_at
    assert_equal "Tank Alarm", second_entry.category
    assert_equal "Tank High Water Warning", second_entry.type
    assert_equal "Other", second_entry.sensor_category
  end
end
