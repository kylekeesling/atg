# frozen_string_literal: true

require "test_helper"

class SystemRevisionReportTest < Minitest::Test
  def test_system_revision_report
    entries = report_response(Atg::SystemRevisionReport)

    assert_equal 1, entries.size

    entry = entries.first
    assert_equal "346321-100-A", entry.software_number
    assert_equal "346321", entry.base_number
    assert_equal "100", entry.version
    assert_equal "A", entry.revision
    assert_equal DateTime.new(2012, 2, 24, 10, 5), entry.created_at
  end
end
