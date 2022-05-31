# frozen_string_literal: true

module Atg
  class ThreeWireSensorStatusReport < Report
    ENTRY_LENGTH = 6
    ENTRY_START_POSITION = 16

    def self.code
      "i34600"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
