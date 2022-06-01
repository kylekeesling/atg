# frozen_string_literal: true

require "net/telnet"

module Atg
  class TestAdapter < Base
    def initialize
    end

    def description
      "Test Adapter"
    end

    def write(command_string)
      command_string.delete!(SOH)
      command_string.delete!(EXT)

      fixture_path = "#{Dir.pwd}/test/fixtures/#{command_string}.txt"
      File.read(fixture_path)
    end

    def close
      # noop - not needed for testing
    end
  end
end
