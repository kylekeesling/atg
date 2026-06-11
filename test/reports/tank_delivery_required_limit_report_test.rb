# frozen_string_literal: true

require "test_helper"

class TankDeliveryRequiredLimitReportTest < Minitest::Test
  def test_tank_delivery_required_limit_report
    entries = report_response(Atg::TankDeliveryRequiredLimitReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 0.0, entries[0].delivery_required_limit, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 0.0, entries[1].delivery_required_limit, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 0.0, entries[2].delivery_required_limit, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 0.0, entries[3].delivery_required_limit, 0.01
  end
end
