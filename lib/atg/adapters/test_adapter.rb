# frozen_string_literal: true

require "net/telnet"

module Atg
  class TestAdapter < Base
    def initialize(stub:)
      @stub = stub
    end

    def description
      "Test Adapter"
    end

    def write(command_string)
      @stub
    end

    def close
      # noop - not needed for testing
    end
  end
end
