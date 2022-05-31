# frozen_string_literal: true

module Atg
  class UniversalSensorStatusReport < Report
    ENTRY_LENGTH = 6
    ENTRY_START_POSITION = 16

    def self.code
      "i34B00"
    end

    def self.response_object
      SensorStatusResult
    end
  end
end
