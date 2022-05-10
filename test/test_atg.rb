# frozen_string_literal: true

require "test_helper"

class TestAtg < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Atg::VERSION
  end

  # def test_it_does_something_useful
  #   mock = MiniTest::Mock.new
  #   mock.expect :
  #   Atg::LiquidSensorReport.run(port: SERIAL_PORT)
  # end
end
