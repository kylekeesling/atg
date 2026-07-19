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

  def test_parse_timestamp_raises_on_a_garbled_stamp
    # A garbled stamp (month/day 00) must raise so the caller rejects the frame
    # instead of parsing garbage — a real device frame always has a valid
    # timestamp, so an unparseable one means the response isn't a real frame.
    assert_raises(ArgumentError) { @base.parse_timestamp("2600000000") }
  end
end
