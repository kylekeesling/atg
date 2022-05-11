# frozen_string_literal: true

require "test_helper"

class TankInventoryReportTest < Minitest::Test
  def test_tank_inventory_report
    entries = report_response(Atg::TankInventoryReport)

    assert_equal 1, entries.size

    first_entry = entries[0]
    assert_equal "01", first_entry.tank_number
    assert_equal "1", first_entry.product_code
    assert_equal "0000", first_entry.tank_status_bits
    assert_equal "07", first_entry.number_of_fields
    assert_equal 1763.0, first_entry.volume
    assert_equal 1747.0, first_entry.tc_volume
    assert_equal 237.0, first_entry.ullage
    assert_equal 39.55375289916992, first_entry.height
    assert_equal 6.911120414733887, first_entry.water
    assert_equal 72.29624938964844, first_entry.temperature
    assert_equal 177.26719665527344, first_entry.water_volume
  end
end
