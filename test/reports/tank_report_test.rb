# frozen_string_literal: true

require "test_helper"

class TankReportTest < Minitest::Test
  def test_liquid_sensor_report
    entries = report_response(Atg::TankReport)

    assert_equal 4, entries.size

    first_entry = entries[0]
    assert_equal 1, first_entry.id
    assert_equal "01", first_entry.number
    assert_equal "UNLEADED", first_entry.product_label

    entries[1..3].each.with_index(2) do |entry, index|
      assert_equal index, entry.id
      assert_equal "0#{index}", entry.number
      assert_equal "", entry.product_label
    end
  end
end
