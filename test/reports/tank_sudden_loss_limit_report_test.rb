# frozen_string_literal: true

require "test_helper"

class TankSuddenLossLimitReportTest < Minitest::Test
  def test_tank_sudden_loss_limit_report
    entries = report_response(Atg::TankSuddenLossLimitReport)

    assert_equal 4, entries.size

    assert_equal "01", entries[0].number
    assert_in_delta 999.0, entries[0].sudden_loss_limit, 0.01

    assert_equal "02", entries[1].number
    assert_in_delta 999.0, entries[1].sudden_loss_limit, 0.01

    assert_equal "03", entries[2].number
    assert_in_delta 999.0, entries[2].sudden_loss_limit, 0.01

    assert_equal "04", entries[3].number
    assert_in_delta 999.0, entries[3].sudden_loss_limit, 0.01
  end
end
