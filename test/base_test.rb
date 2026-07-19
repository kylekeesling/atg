# frozen_string_literal: true

require "test_helper"

class BaseTest < Minitest::Test
  def setup
    @base = Atg::Base.new
  end

  def test_parse_timestamp_parses_a_valid_stamp
    assert_equal DateTime.new(2026, 6, 11, 10, 15), @base.parse_timestamp("2606111015")
  end

  def test_parse_timestamp_handles_20th_century_years
    assert_equal DateTime.new(1998, 3, 4, 5, 6), @base.parse_timestamp("9803040506")
  end

  def test_parse_timestamp_returns_nil_for_a_garbled_stamp
    # A live TLS-350 frame with a month/day of 00 must not raise ArgumentError
    # and sink the whole report — responded_at just comes back nil.
    assert_nil @base.parse_timestamp("2600000000")
  end
end
