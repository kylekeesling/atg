# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "atg"
require "debug"
require "minitest/autorun"

class Minitest::Test
  def report_response(report, data_field: nil)
    report.new(adapter: Atg::TestAdapter.new).run(data_field: data_field)
  end
end
