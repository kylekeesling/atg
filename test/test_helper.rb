# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "atg"

require "minitest/autorun"

class Minitest::Test
  def stubbed_response(command_string:)
    File.read("test/fixtures/#{command_string}.txt")
  end

  def report_response(report, data_field: nil)
    code = report.code
    command_string = [code, data_field].reject(&:nil?).join
    adapter = Atg::TestAdapter.new(stub: stubbed_response(command_string: command_string))
    response = report.run(adapter: adapter)

    response.entries
  end
end
