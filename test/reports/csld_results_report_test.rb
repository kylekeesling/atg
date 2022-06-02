# frozen_string_literal: true

require "test_helper"

class CsldResultsReportTest < Minitest::Test
  def test_csld_results_report
    entries = report_response(Atg::CsldResultsReport)

    assert_equal 2, entries.size

    first_entry = entries[0]
    assert_equal "01", first_entry.tank_number
    assert_equal "01", first_entry.result_code
    assert_equal "PASS", first_entry.result

    first_entry = entries[1]
    assert_equal "02", first_entry.tank_number
    assert_equal "02", first_entry.result_code
    assert_equal "FAIL", first_entry.result
  end
end
