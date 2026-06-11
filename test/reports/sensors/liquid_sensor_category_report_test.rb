# frozen_string_literal: true

require "test_helper"

class LiquidSensorCategoryReportTest < Minitest::Test
  def test_liquid_sensor_category_report
    entries = report_response(Atg::LiquidSensorCategoryReport)

    assert_equal 8, entries.size
    assert_equal :stp_sump, entries[0].category
    assert_equal :stp_sump, entries[1].category
    assert_equal :stp_sump, entries[2].category
    assert_equal :other, entries[3].category
    assert_equal :other, entries[7].category
  end
end
