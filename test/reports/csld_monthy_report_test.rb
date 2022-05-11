# frozen_string_literal: true

require "test_helper"

class AlarmHistoryReportTest < Minitest::Test
  def test_csld_monthly_current_month_report
    entries = report_response(Atg::CsldMonthlyReport, data_field: 0)

    assert_equal 0, entries.size
  end

  def test_csld_monthly_previous_month_report
    entries = report_response(Atg::CsldMonthlyReport, data_field: 1)

    assert_equal 0, entries.size
  end
end
